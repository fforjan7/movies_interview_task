import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/models/domain/movie.dart';
import 'package:movies_interview_task/data/models/persistence/db_genre.dart';

import '../../../common/constants/constants.dart';

part 'db_movie.g.dart';

@HiveType(typeId: AppConstants.moviesTypeAdapterId)
class DbMovie extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String backdropPath;
  @HiveField(4)
  final String posterPath;
  @HiveField(5)
  final double vote;
  @HiveField(6)
  final List<DbGenre> dbGenres;
  @HiveField(7)
  bool isFavorite;

  DbMovie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.vote,
    required this.dbGenres,
    this.isFavorite = false,
  });

  Movie asDomain() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      backdropPath: backdropPath,
      posterPath: posterPath,
      vote: vote,
      genres: dbGenres.map((dbGenre) => dbGenre.asDomain()).toList(),
      isFavorite: isFavorite,
    );
  }
}
