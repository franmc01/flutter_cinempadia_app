import 'package:app/domain/entities/actor.dart';
import 'package:app/presentation/providers/actors_repository_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActors;
  ActorByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId); 
    state = {...state, movieId: actors};
  }
}


final actorByMovieProvider = StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>((ref){
  final actorRepository = ref.watch(actorRepositoryProvider);

  return ActorByMovieNotifier(getActors: actorRepository.getActorsByMovie);
});