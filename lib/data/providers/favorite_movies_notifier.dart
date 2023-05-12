import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/models/state/favorite_movies_state.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';

import '../../common/enums/state_enum.dart';
import '../models/persistence/db_movie.dart';
import '../repositories/movies_repository.dart';

class FavoriteMoviesNotifier extends StateNotifier<FavoriteMoviesState> {
  FavoriteMoviesNotifier(this.ref, this.repository)
      : super(_initState(repository));

  final Ref ref;
  final MoviesRepository repository;

  static FavoriteMoviesState _initState(MoviesRepository repository) {
    AppState initialAppState = AppState.initial;

    ValueListenable<Box<DbMovie>> initialFavoriteMoviesListenable =
        repository.getFavoriteMoviesListenable();

    return FavoriteMoviesState(
      appState: initialAppState,
      favoriteMoviesListenable: initialFavoriteMoviesListenable,
    );
  }

  Future<void> changeIsFavorite(movieId) async {
    state = state..appState = AppState.loading;
    try {
      await repository.changeIsFavorite(movieId);
    } catch (e) {
      state = state..appState = AppState.error;
      print(e);
    }
    state = state..appState = AppState.success;
  }
}

final favoriteMoviesProvider =
    StateNotifierProvider<FavoriteMoviesNotifier, FavoriteMoviesState>((ref) {
  late MoviesRepository repository;
  ref.watch(moviesRepositoryProvider).whenData((repo) => repository = repo);
  return FavoriteMoviesNotifier(ref, repository);
});
