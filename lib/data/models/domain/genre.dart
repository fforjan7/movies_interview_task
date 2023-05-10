import 'package:freezed_annotation/freezed_annotation.dart';

import '../persistence/db_genre.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  const Genre._();
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  DbGenre asDatabase() {
    return DbGenre(id: id, name: name);
  }
}
