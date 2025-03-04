import 'package:app/presentation/delegates/search_movie_delegate.dart';
import 'package:app/presentation/providers/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            spacing: 8,
            children: [
              Icon(Icons.movie_creation_outlined, color: colors.primary),
              Text('Cinemapedia', style: titleStyle),
              Spacer(),
              Positioned(
                child: IconButton(
                    onPressed: () {
                      final movieRepository = ref.read(movieRepositoryProvider);

                      showSearch(
                          context: context,
                          delegate: SearchMovieDelegate(
                              searchMovies: movieRepository.searchMovies)
                          );
                    },
                    icon: Icon(Icons.search)),
              )
            ],
          )),
    );
  }
}
