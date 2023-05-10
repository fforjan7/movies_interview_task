import 'package:movies_interview_task/data/models/domain/genre.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double vote;
  final bool isFavorite;
  final List<Genre> genres;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.vote,
    required this.isFavorite,
    required this.genres,
  });
}
