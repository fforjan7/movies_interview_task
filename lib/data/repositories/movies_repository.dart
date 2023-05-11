import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/data/models/persistence/db_genre.dart';

import '../../services/movies_service.dart';
import '../models/persistence/db_movie.dart';

abstract class IMoviesRepository {
  Future<void> saveGenresToDb();
  List<DbGenre> getGenresFromDb();

  Future<void> saveMoviesPageToDb(int page);
  List<DbMovie> getMoviesFromDb();

  Future<void> changeIsFavorite(int movieId);
  List<DbMovie> getFavoriteMoviesFromDb();
}

class MoviesRepository implements IMoviesRepository {
  final MoviesService _moviesService;
  final Box<DbGenre> _genresBox;
  final Box<DbMovie> _moviesBox;
  final Box<DbMovie> _favoriteMoviesBox;

  MoviesRepository(
    this._moviesService,
    this._genresBox,
    this._moviesBox,
    this._favoriteMoviesBox,
  );

  // genres related methods:
  @override
  Future<void> saveGenresToDb() async {
    final genresResponse = await _moviesService.fetchGenres();
    await _genresBox.clear();
    for (var genre in genresResponse.genres) {
      DbGenre dbGenre = genre.asDatabase();
      await _genresBox.put(dbGenre.id, dbGenre);
    }
  }

  @override
  List<DbGenre> getGenresFromDb() {
    List<DbGenre> dbGenres = _genresBox.values.toList();
    //List<Genre> genres = dbGenres.map((dbGenre) => dbGenre.asDomain()).toList();
    return dbGenres;
  }

  //movies related methods:
  @override
  Future<void> saveMoviesPageToDb(int page) async {
    final popularMoviesResponse = await _moviesService.getPopularMovies(page);
    if (page == 1) {
      await _moviesBox.clear();
    }
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
      await _moviesBox.put(dbMovie.id, dbMovie);
    }
  }

  ValueListenable<Box<DbMovie>> getMoviesListenable() {
    return _moviesBox.listenable();
  }

  @override
  List<DbMovie> getMoviesFromDb() {
    List<DbMovie> dbMovies = _moviesBox.values.toList();
    //List<Movie> movies = dbMovies.map((dbMovie) => dbMovie.asDomain()).toList();
    return dbMovies;
  }

  //favorite movies related methods:
  @override
  Future<void> changeIsFavorite(int movieId) async {}

  @override
  List<DbMovie> getFavoriteMoviesFromDb() {
    return [];
  }
}
