import 'package:app/presentation/screens/app_screen.dart';
import 'package:app/presentation/screens/movie_detail_screen.dart';
import 'package:app/presentation/views/favorites_view.dart';
import 'package:app/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeView(),
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieDetailScreen.name,
              builder: (context, state) => MovieDetailScreen(
                movieId: state.pathParameters['id'] ?? 'no-id',
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => FavoritesView(),
        ),
      ],
    ),
  ],
);
