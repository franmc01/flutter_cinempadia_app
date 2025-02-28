
import 'package:app/infrastructure/datasources/actors_datasource_impl.dart';
import 'package:app/infrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(datasource: ActorsDatasourceImpl());
});