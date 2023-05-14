import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/models/state/movies_state.dart';
import 'package:movies_interview_task/data/providers/connectivity_provider.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';
import 'package:movies_interview_task/data/repositories/movies_repository.dart';

import '../../common/enums/state_enum.dart';
import '../../utils/server_exception.dart';

class MoviesNotifier extends StateNotifier<MoviesState> {
  MoviesNotifier(
    this.ref,
    this.repository,
    this.connectivityResult,
  ) : super(MoviesState(
          page: 1,
          error: "",
          appState: AppState.initial,
          moviesListenable: repository.getMoviesListenable(),
        )) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await _initState();
      },
    );
  }

  final Ref ref;
  final MoviesRepository repository;
  final ConnectivityResult connectivityResult;

  Future<void> _initState() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      if (connectivityResult != ConnectivityResult.none) {
        if (repository.getGenresFromDb().isEmpty) {
          await repository.fetchAndSaveGenresToDb();
        }
        await repository.fetchAndSaveMoviesPageToDb(state.page);
      }
    } catch (e) {
      if (e is ServerException) {
        state = state.copyWith(appState: AppState.error, error: e.message());
        print(e.message());
      }
    }
  }

  void setInitialState() {
    state = state.copyWith(appState: AppState.initial, error: '');
  }

  Future<void> fetchAndSaveMoviesPageToDb([int? page]) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      state = state.copyWith(page: state.page + 1);
      if (repository.getGenresFromDb().isEmpty) {
        await repository.fetchAndSaveGenresToDb();
      }

      await repository.fetchAndSaveMoviesPageToDb(page ?? state.page);
    } catch (e) {
      if (e is ServerException) {
        state = state.copyWith(appState: AppState.error, error: e.message());
        print(e.message());
      }
    }
    state = state.copyWith(appState: AppState.initial);
  }

  Future<void> changeIsFavorite(movieId) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await repository.changeIsFavorite(movieId);
    } catch (e) {
      state = state.copyWith(appState: AppState.error);
    }
    state = state.copyWith(appState: AppState.initial);
  }
}

final moviesProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>((ref) {
  late MoviesRepository repository;
  var connectivity = ref.watch(connectivityProvider);

  ref.watch(moviesRepositoryProvider).whenData((repo) => repository = repo);
  return MoviesNotifier(ref, repository, connectivity);
});
