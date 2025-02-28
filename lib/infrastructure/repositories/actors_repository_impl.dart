import 'package:app/domain/datasources/actors_datasource.dart';
import 'package:app/domain/entities/actor.dart';
import 'package:app/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  final ActorsDatasource datasource;

  ActorsRepositoryImpl({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
