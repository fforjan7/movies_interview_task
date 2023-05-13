import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../common/enums/state_enum.dart';
import '../persistence/db_movie.dart';

part 'favorite_movies_state.freezed.dart';

@freezed
class FavoriteMoviesState with _$FavoriteMoviesState {
  const factory FavoriteMoviesState({
    required AppState appState,
    required ValueListenable<Box<DbMovie>> favoriteMoviesListenable,
  }) = _FavoriteMoviesState;
}
