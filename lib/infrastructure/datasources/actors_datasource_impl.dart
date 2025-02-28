import 'package:app/domain/datasources/actors_datasource.dart';
import 'package:app/domain/entities/actor.dart';
import 'package:app/infrastructure/mappers/actor_mapper.dart';
import 'package:app/infrastructure/models/credits_response.dart';
import 'package:app/shared/constants/environment.dart';
import 'package:dio/dio.dart';

class ActorsDatasourceImpl implements ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey
      }
    )
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get('/movie/$movieId/credits');
    final data = CreditsResponse.fromJson(response.data);

    return data.cast.map((e) => ActorMapper.castToEntity(e)).toList();
  }

}