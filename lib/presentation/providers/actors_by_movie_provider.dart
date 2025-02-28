import 'package:app/domain/entities/actor.dart';
import 'package:app/presentation/providers/actors_repository_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActor;
  ActorByMovieNotifier({required this.getActor}) : super({});

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;

    final actor = await getActor(movieId); 
    state = {...state, movieId: actor};
  }
}


final actorByMovieProvider = StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>((ref){
  final actorRepository = ref.watch(actorRepositoryProvider);

  return ActorByMovieNotifier(getActor: actorRepository.getActorsByMovie);
});