// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieResponse _$$_MovieResponseFromJson(Map<String, dynamic> json) =>
    _$_MovieResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      vote: (json['vote_average'] as num?)?.toDouble(),
      genres:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_MovieResponseToJson(_$_MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'vote_average': instance.vote,
      'genre_ids': instance.genres,
    };
