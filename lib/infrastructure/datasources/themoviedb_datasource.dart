

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

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final data = TheMovieDbResponse.fromJson(response.data);

    // final List<Movie> movies = data.results.map(
    return data.results.map(
      (moviedb) => MovieMapper.movieDbToEntity(moviedb)    
    ).toList();
  }
}