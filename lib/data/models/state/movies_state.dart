import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../common/enums/state_enum.dart';
import '../persistence/db_movie.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    required int page,
    required String error,
    required AppState appState,
    required ValueListenable<Box<DbMovie>> moviesListenable,
  }) = _MoviesState;
}
