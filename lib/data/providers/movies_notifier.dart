import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/data/models/state/movies_state.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';
import 'package:movies_interview_task/data/repositories/movies_repository.dart';

import '../../common/enums/state_enum.dart';
import '../models/persistence/db_movie.dart';

class MoviesNotifier extends StateNotifier<MoviesState> {
  MoviesNotifier(this.ref, this.repository) : super(_initState(repository));

  final Ref ref;
  final MoviesRepository repository;

  static MoviesState _initState(MoviesRepository repository) {
    int initialPage = 1;
    AppState initialAppState = AppState.initial;

    ValueListenable<Box<DbMovie>> initialMoviesListenable =
        repository.getMoviesListenable();

    return MoviesState(
      page: initialPage,
      appState: initialAppState,
      moviesListenable: initialMoviesListenable,
    );
  }
}

final moviesProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>((ref) {
  late MoviesRepository repository;
  ref.watch(moviesRepositoryProvider).whenData((repo) => repository = repo);
  return MoviesNotifier(ref, repository);
});
