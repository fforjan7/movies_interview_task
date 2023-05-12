import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../common/enums/state_enum.dart';
import '../persistence/db_movie.dart';

class FavoriteMoviesState {
  AppState appState;
  ValueListenable<Box<DbMovie>> favoriteMoviesListenable;

  FavoriteMoviesState({
    required this.appState,
    required this.favoriteMoviesListenable,
  });
}
