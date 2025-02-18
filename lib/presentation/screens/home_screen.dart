import 'package:app/presentation/providers/movies_providers.dart';
import 'package:app/presentation/providers/movies_slideshow_provider.dart';
import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:app/presentation/widgets/custom_botton_navigation.dart';
import 'package:app/presentation/widgets/movies_horizontal_listview.dart';
import 'package:app/presentation/widgets/movies_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: _HomeView(), bottomNavigationBar: CustomBottonNavigation());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingSlideMovies = ref.watch(moviesSlideshowProvider);

    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: nowPlayingSlideMovies),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'In cinema',
          loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        )
      ],
    );
  }
}
