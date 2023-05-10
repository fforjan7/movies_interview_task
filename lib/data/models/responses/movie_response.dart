import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'vote_average') required double vote,
    @JsonKey(name: 'genre_ids') required List<int> genres,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
