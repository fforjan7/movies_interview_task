// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteMoviesState {
  AppState get appState => throw _privateConstructorUsedError;
  ValueListenable<Box<DbMovie>> get favoriteMoviesListenable =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteMoviesStateCopyWith<FavoriteMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMoviesStateCopyWith<$Res> {
  factory $FavoriteMoviesStateCopyWith(
          FavoriteMoviesState value, $Res Function(FavoriteMoviesState) then) =
      _$FavoriteMoviesStateCopyWithImpl<$Res, FavoriteMoviesState>;
  @useResult
  $Res call(
      {AppState appState,
      ValueListenable<Box<DbMovie>> favoriteMoviesListenable});
}

/// @nodoc
class _$FavoriteMoviesStateCopyWithImpl<$Res, $Val extends FavoriteMoviesState>
    implements $FavoriteMoviesStateCopyWith<$Res> {
  _$FavoriteMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appState = null,
    Object? favoriteMoviesListenable = null,
  }) {
    return _then(_value.copyWith(
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      favoriteMoviesListenable: null == favoriteMoviesListenable
          ? _value.favoriteMoviesListenable
          : favoriteMoviesListenable // ignore: cast_nullable_to_non_nullable
              as ValueListenable<Box<DbMovie>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteMoviesStateCopyWith<$Res>
    implements $FavoriteMoviesStateCopyWith<$Res> {
  factory _$$_FavoriteMoviesStateCopyWith(_$_FavoriteMoviesState value,
          $Res Function(_$_FavoriteMoviesState) then) =
      __$$_FavoriteMoviesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppState appState,
      ValueListenable<Box<DbMovie>> favoriteMoviesListenable});
}

/// @nodoc
class __$$_FavoriteMoviesStateCopyWithImpl<$Res>
    extends _$FavoriteMoviesStateCopyWithImpl<$Res, _$_FavoriteMoviesState>
    implements _$$_FavoriteMoviesStateCopyWith<$Res> {
  __$$_FavoriteMoviesStateCopyWithImpl(_$_FavoriteMoviesState _value,
      $Res Function(_$_FavoriteMoviesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appState = null,
    Object? favoriteMoviesListenable = null,
  }) {
    return _then(_$_FavoriteMoviesState(
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      favoriteMoviesListenable: null == favoriteMoviesListenable
          ? _value.favoriteMoviesListenable
          : favoriteMoviesListenable // ignore: cast_nullable_to_non_nullable
              as ValueListenable<Box<DbMovie>>,
    ));
  }
}

/// @nodoc

class _$_FavoriteMoviesState
    with DiagnosticableTreeMixin
    implements _FavoriteMoviesState {
  const _$_FavoriteMoviesState(
      {required this.appState, required this.favoriteMoviesListenable});

  @override
  final AppState appState;
  @override
  final ValueListenable<Box<DbMovie>> favoriteMoviesListenable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FavoriteMoviesState(appState: $appState, favoriteMoviesListenable: $favoriteMoviesListenable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FavoriteMoviesState'))
      ..add(DiagnosticsProperty('appState', appState))
      ..add(DiagnosticsProperty(
          'favoriteMoviesListenable', favoriteMoviesListenable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteMoviesState &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(
                    other.favoriteMoviesListenable, favoriteMoviesListenable) ||
                other.favoriteMoviesListenable == favoriteMoviesListenable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, appState, favoriteMoviesListenable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteMoviesStateCopyWith<_$_FavoriteMoviesState> get copyWith =>
      __$$_FavoriteMoviesStateCopyWithImpl<_$_FavoriteMoviesState>(
          this, _$identity);
}

abstract class _FavoriteMoviesState implements FavoriteMoviesState {
  const factory _FavoriteMoviesState(
      {required final AppState appState,
      required final ValueListenable<Box<DbMovie>>
          favoriteMoviesListenable}) = _$_FavoriteMoviesState;

  @override
  AppState get appState;
  @override
  ValueListenable<Box<DbMovie>> get favoriteMoviesListenable;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteMoviesStateCopyWith<_$_FavoriteMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}
