import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/models/state/favorite_movies_state.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';

import '../../common/enums/state_enum.dart';
import '../repositories/movies_repository.dart';

class FavoriteMoviesNotifier extends StateNotifier<FavoriteMoviesState> {
  FavoriteMoviesNotifier(this.ref, this.repository)
      : super(FavoriteMoviesState(
          appState: AppState.initial,
          favoriteMoviesListenable: repository.getFavoriteMoviesListenable(),
        ));

  final Ref ref;
  final MoviesRepository repository;

  Future<void> changeIsFavorite(movieId) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await repository.changeIsFavorite(movieId);
    } catch (e) {
      state = state.copyWith(appState: AppState.error);
      print(e);
    }
    state = state.copyWith(appState: AppState.success);
  }
}

final favoriteMoviesProvider =
    StateNotifierProvider<FavoriteMoviesNotifier, FavoriteMoviesState>((ref) {
  late MoviesRepository repository;
  ref.watch(moviesRepositoryProvider).whenData((repo) => repository = repo);
  return FavoriteMoviesNotifier(ref, repository);
});
