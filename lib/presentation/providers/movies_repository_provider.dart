


import 'package:app/infrastructure/datasources/themoviedb_datasource.dart';
import 'package:app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(ThemoviedbDatasource());
});