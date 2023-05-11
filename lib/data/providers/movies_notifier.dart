import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/data/models/state/movies_state.dart';

import '../../common/enums/state_enum.dart';
import '../models/persistence/db_movie.dart';

class MoviesNotifier extends StateNotifier<MoviesState> {
  MoviesNotifier(
    this.ref,
  ) : super(_initState());
  final Ref ref;

  static MoviesState _initState() {
    int initialPage = 1;
    AppState initialAppState = AppState.initial;

    ValueListenable<Box<DbMovie>> initialMoviesListenable =
        Hive.box<DbMovie>('movies').listenable();

    return MoviesState(
      page: initialPage,
      appState: initialAppState,
      moviesListenable: initialMoviesListenable,
    );
  }
}

final moviesProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>((ref) {
  return MoviesNotifier(
    ref,
  );
});
