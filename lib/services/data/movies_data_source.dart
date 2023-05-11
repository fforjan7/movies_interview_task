import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/data/models/responses/genres_response.dart';
import 'package:movies_interview_task/data/models/responses/popular_movies_response.dart';

import '../../data/models/persistence/db_genre.dart';
import '../../data/models/persistence/db_movie.dart';

class MoviesDataSource {
  final Box<DbGenre> _genresBox;
  final Box<DbMovie> _moviesBox;
  final Box<DbMovie> _favoriteMoviesBox;

  MoviesDataSource(this._genresBox, this._moviesBox, this._favoriteMoviesBox);

  Future<void> saveGenresToDb(GenresResponse genresResponse) async {
    await _genresBox.clear();
    for (var genre in genresResponse.genres) {
      DbGenre dbGenre = genre.asDatabase();
      await _genresBox.add(dbGenre);
    }
  }

  List<DbGenre> getGenres() {
    return _genresBox.values.toList();
  }

  Future<void> clearMovieDb() async {
    await _moviesBox.clear();
  }

  Future<void> saveMoviesPageToDb(
      PopularMoviesResponse popularMoviesResponse) async {
    for (var movie in popularMoviesResponse.movies) {
      List<DbGenre> dbGenres = _genresBox.values
          .where((dbGenre) => movie.genres?.contains(dbGenre.id) ?? false)
          .toList();

      final dbMovie = DbMovie(
        id: movie.id ?? -1,
        title: movie.title ?? "",
        overview: movie.overview ?? "",
        backdropPath: movie.backdropPath ?? "",
        posterPath: movie.posterPath ?? "",
        vote: movie.vote ?? 0,
        dbGenres: dbGenres,
      );
      await _moviesBox.add(dbMovie);
    }
  }

  ValueListenable<Box<DbMovie>> getMoviesListenable() {
    return _moviesBox.listenable();
  }

  Future<void> changeIsFavorite(int movieId) async {}

  ValueListenable<Box<DbMovie>> getFavoriteMoviesListenable() {
    return _favoriteMoviesBox.listenable();
  }
}
