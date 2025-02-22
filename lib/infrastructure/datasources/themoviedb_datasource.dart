

import 'package:app/domain/datasources/movie_datasource.dart';
import 'package:app/domain/entities/movie.dart';
import 'package:app/infrastructure/mappers/movie_mapper.dart';
import 'package:app/infrastructure/models/themoviedb_response.dart';
import 'package:app/shared/constants/environment.dart';
import 'package:dio/dio.dart';

class ThemoviedbDatasource extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey
      }
    )
  );


  List<Movie> _jsonToMovies(Map<String,dynamic> json ){
    final data = TheMovieDbResponse.fromJson(json);

    // final List<Movie> movies = data.results.map(
    return data.results.map(
      (moviedb) => MovieMapper.movieDbToEntity(moviedb)    
    ).toList();
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page
    });

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page
    });

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page
    });

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page
    });

    return _jsonToMovies(response.data);
  }

  
}