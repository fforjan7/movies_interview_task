import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../common/enums/state_enum.dart';
import '../persistence/db_movie.dart';

class MoviesState {
  int page;
  AppState appState;
  ValueListenable<Box<DbMovie>> moviesListenable;

  MoviesState({
    required this.page,
    required this.appState,
    required this.moviesListenable,
  });
}
