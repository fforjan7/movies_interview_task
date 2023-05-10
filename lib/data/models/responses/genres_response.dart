import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/genre.dart';

part 'genres_response.freezed.dart';
part 'genres_response.g.dart';

@freezed
class GenresResponse with _$GenresResponse {
  const factory GenresResponse({
    required List<Genre> genres,
  }) = _GenresResponse;

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);
}
