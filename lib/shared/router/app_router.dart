import 'package:app/presentation/screens/home_screen.dart';
import 'package:app/presentation/screens/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieDetailScreen.name,
          builder: (context, state) => MovieDetailScreen(
            movieId: state.pathParameters['id'] ?? 'no-id'
          ),
        )
      ]),
]);
