import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/data/models/state/movies_state.dart';
import 'package:movies_interview_task/data/providers/connectivity_provider.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';
import 'package:movies_interview_task/data/repositories/movies_repository.dart';

import '../../common/enums/state_enum.dart';
import '../models/persistence/db_movie.dart';

class MoviesNotifier extends StateNotifier<MoviesState> {
  MoviesNotifier(this.ref, this.repository, this.connectivityResult)
      : super(_initState(repository, connectivityResult));

  final Ref ref;
  final MoviesRepository repository;
  final ConnectivityResult connectivityResult;

  static MoviesState _initState(
      MoviesRepository repository, ConnectivityResult connectivityResult) {
    int initialPage = 1;
    if (connectivityResult != ConnectivityResult.none) {
      repository.fetchAndSaveMoviesPageToDb(initialPage);
    }

    AppState initialAppState = AppState.initial;

    ValueListenable<Box<DbMovie>> initialMoviesListenable =
        repository.getMoviesListenable();

    return MoviesState(
      page: initialPage,
      appState: initialAppState,
      moviesListenable: initialMoviesListenable,
    );
  }

  Future<void> fetchAndSaveMoviesPageToDb() async {
    state = state..appState = AppState.loading;
    try {
      print(state.appState);
      state = state..page += 1;

      await repository.fetchAndSaveMoviesPageToDb(state.page);
    } catch (e) {
      state = state..appState = AppState.error;
      print(e);
    }
    state = state..appState = AppState.success;
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

final moviesProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>((ref) {
  late MoviesRepository repository;
  var connectivity = ref.watch(connectivityProvider);
  ref.watch(moviesRepositoryProvider).whenData((repo) => repository = repo);
  return MoviesNotifier(ref, repository, connectivity);
});
