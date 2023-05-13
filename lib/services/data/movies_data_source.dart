import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/data/models/responses/genres_response.dart';
import 'package:movies_interview_task/data/models/responses/popular_movies_response.dart';

import '../../data/models/persistence/db_genre.dart';
import '../../data/models/persistence/db_movie.dart';

abstract class IMoviesDataSource {
  Future<void> saveGenresToDb(GenresResponse genresResponse);
  List<DbGenre> getGenres();
  Future<void> clearMovieDb();
  Future<void> saveMoviesPageToDb(PopularMoviesResponse popularMoviesResponse);
  ValueListenable<Box<DbMovie>> getMoviesListenable();
  Future<void> changeIsFavorite(int movieId);
  Future<void> addToFavoriteMoviesBox(DbMovie movie);
  deleteFromFavoriteMoviesBox(int movieId);
}

class MoviesDataSource implements IMoviesDataSource {
  final Box<DbGenre> _genresBox;
  final Box<DbMovie> _moviesBox;
  final Box<DbMovie> _favoriteMoviesBox;

  MoviesDataSource(this._genresBox, this._moviesBox, this._favoriteMoviesBox);

  @override
  Future<void> saveGenresToDb(GenresResponse genresResponse) async {
    await _genresBox.clear();
    for (var genre in genresResponse.genres) {
      DbGenre dbGenre = genre.asDatabase();
      await _genresBox.add(dbGenre);
    }
  }

  @override
  List<DbGenre> getGenres() {
    return _genresBox.values.toList();
  }

  @override
  Future<void> clearMovieDb() async {
    await _moviesBox.clear();
  }

  @override
  Future<void> saveMoviesPageToDb(
      PopularMoviesResponse popularMoviesResponse) async {
    for (var movie in popularMoviesResponse.movies) {
      //get List<DbGenre> from List<int>
      List<DbGenre> dbGenres = _genresBox.values
          .where((dbGenre) => movie.genres?.contains(dbGenre.id) ?? false)
          .toList();
      //check if its in favorite movies
      bool isInFavorites = false;
      for (var favoriteMovie in _favoriteMoviesBox.values) {
        if (favoriteMovie.id == movie.id) {
          isInFavorites = true;
        }
      }
      final dbMovie = DbMovie(
        id: movie.id ?? -1,
        title: movie.title ?? "",
        overview: movie.overview ?? "",
        backdropPath: movie.backdropPath ?? "",
        posterPath: movie.posterPath ?? "",
        vote: movie.vote ?? 0,
        dbGenres: dbGenres,
        isFavorite: isInFavorites,
      );
      await _moviesBox.add(dbMovie);
    }
  }

  @override
  ValueListenable<Box<DbMovie>> getMoviesListenable() {
    return _moviesBox.listenable();
  }

  @override
  Future<void> changeIsFavorite(int movieId) async {
    bool isOnlyInFavoriteMovies = true;
    for (var movie in _moviesBox.values) {
      if (movie.id == movieId) {
        isOnlyInFavoriteMovies = false;
        movie.isFavorite = !movie.isFavorite;
        await _moviesBox.put(movie.key, movie);
        //add/remove to favorite movies
        if (movie.isFavorite) {
          await addToFavoriteMoviesBox(movie);
        } else {
          await deleteFromFavoriteMoviesBox(movieId);
        }
      }
    }
    if (isOnlyInFavoriteMovies) {
      deleteFromFavoriteMoviesBox(movieId);
    }
  }

  @override
  Future<void> addToFavoriteMoviesBox(DbMovie movie) async {
    var favoriteMovie = DbMovie(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      backdropPath: movie.backdropPath,
      posterPath: movie.posterPath,
      vote: movie.vote,
      dbGenres: movie.dbGenres,
      isFavorite: true,
    );
    await _favoriteMoviesBox.add(favoriteMovie);
  }

  @override
  Future<void> deleteFromFavoriteMoviesBox(int movieId) async {
    for (var movie in _favoriteMoviesBox.values) {
      if (movie.id == movieId) {
        await _favoriteMoviesBox.delete(movie.key);
      }
    }
  }

  ValueListenable<Box<DbMovie>> getFavoriteMoviesListenable() {
    return _favoriteMoviesBox.listenable();
  }
}
