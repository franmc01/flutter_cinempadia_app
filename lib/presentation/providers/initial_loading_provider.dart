import 'package:app/presentation/providers/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final moviesProvider = [
    ref.watch(nowPlayingMoviesProvider),
    ref.watch(popularMoviesProvider),
    ref.watch(upcomingMoviesProvider),
    ref.watch(topRatedMoviesProvider),
  ];

  return moviesProvider.any((prov) => prov.isEmpty);
});
