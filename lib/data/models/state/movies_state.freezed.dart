// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoviesState {
  int get page => throw _privateConstructorUsedError;
  AppState get appState => throw _privateConstructorUsedError;
  ValueListenable<Box<DbMovie>> get moviesListenable =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoviesStateCopyWith<MoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesStateCopyWith<$Res> {
  factory $MoviesStateCopyWith(
          MoviesState value, $Res Function(MoviesState) then) =
      _$MoviesStateCopyWithImpl<$Res, MoviesState>;
  @useResult
  $Res call(
      {int page,
      AppState appState,
      ValueListenable<Box<DbMovie>> moviesListenable});
}

/// @nodoc
class _$MoviesStateCopyWithImpl<$Res, $Val extends MoviesState>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? appState = null,
    Object? moviesListenable = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      moviesListenable: null == moviesListenable
          ? _value.moviesListenable
          : moviesListenable // ignore: cast_nullable_to_non_nullable
              as ValueListenable<Box<DbMovie>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoviesStateCopyWith<$Res>
    implements $MoviesStateCopyWith<$Res> {
  factory _$$_MoviesStateCopyWith(
          _$_MoviesState value, $Res Function(_$_MoviesState) then) =
      __$$_MoviesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      AppState appState,
      ValueListenable<Box<DbMovie>> moviesListenable});
}

/// @nodoc
class __$$_MoviesStateCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$_MoviesState>
    implements _$$_MoviesStateCopyWith<$Res> {
  __$$_MoviesStateCopyWithImpl(
      _$_MoviesState _value, $Res Function(_$_MoviesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? appState = null,
    Object? moviesListenable = null,
  }) {
    return _then(_$_MoviesState(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      moviesListenable: null == moviesListenable
          ? _value.moviesListenable
          : moviesListenable // ignore: cast_nullable_to_non_nullable
              as ValueListenable<Box<DbMovie>>,
    ));
  }
}

/// @nodoc

class _$_MoviesState with DiagnosticableTreeMixin implements _MoviesState {
  const _$_MoviesState(
      {required this.page,
      required this.appState,
      required this.moviesListenable});

  @override
  final int page;
  @override
  final AppState appState;
  @override
  final ValueListenable<Box<DbMovie>> moviesListenable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoviesState(page: $page, appState: $appState, moviesListenable: $moviesListenable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoviesState'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('appState', appState))
      ..add(DiagnosticsProperty('moviesListenable', moviesListenable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviesState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(other.moviesListenable, moviesListenable) ||
                other.moviesListenable == moviesListenable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, appState, moviesListenable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviesStateCopyWith<_$_MoviesState> get copyWith =>
      __$$_MoviesStateCopyWithImpl<_$_MoviesState>(this, _$identity);
}

abstract class _MoviesState implements MoviesState {
  const factory _MoviesState(
          {required final int page,
          required final AppState appState,
          required final ValueListenable<Box<DbMovie>> moviesListenable}) =
      _$_MoviesState;

  @override
  int get page;
  @override
  AppState get appState;
  @override
  ValueListenable<Box<DbMovie>> get moviesListenable;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesStateCopyWith<_$_MoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}
