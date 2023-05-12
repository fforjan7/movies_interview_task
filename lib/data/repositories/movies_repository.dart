import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/services/data/movies_data_source.dart';

import '../../services/movies_service.dart';
import '../models/domain/genre.dart';
import '../models/persistence/db_movie.dart';

abstract class IMoviesRepository {
  Future<void> fetchAndSaveGenresToDb();
  List<Genre> getGenresFromDb();
  Future<void> clearMovieDb();

  Future<void> fetchAndSaveMoviesPageToDb(int page);
  ValueListenable<Box<DbMovie>> getMoviesListenable();

  Future<void> changeIsFavorite(int movieId);
  ValueListenable<Box<DbMovie>> getFavoriteMoviesListenable();
}

class MoviesRepository implements IMoviesRepository {
  final MoviesService _moviesService;
  final MoviesDataSource _moviesDataSource;

  MoviesRepository(
    this._moviesService,
    this._moviesDataSource,
  );

  // genres related methods:
  @override
  Future<void> fetchAndSaveGenresToDb() async {
    final genresResponse = await _moviesService.fetchGenres();
    await _moviesDataSource.saveGenresToDb(genresResponse);
  }

  @override
  List<Genre> getGenresFromDb() {
    var dbGenres = _moviesDataSource.getGenres();
    var genres = dbGenres.map((dbGenre) => dbGenre.asDomain()).toList();
    return genres;
  }

  @override
  Future<void> clearMovieDb() async {
    await _moviesDataSource.clearMovieDb();
  }

  //movies related methods:
  @override
  Future<void> fetchAndSaveMoviesPageToDb(int page) async {
    final popularMoviesResponse = await _moviesService.getPopularMovies(page);
    if (page == 1) {
      await clearMovieDb();
    }
    _moviesDataSource.saveMoviesPageToDb(popularMoviesResponse);
  }

  @override
  ValueListenable<Box<DbMovie>> getMoviesListenable() {
    return _moviesDataSource.getMoviesListenable();
  }

  //favorite movies related methods:
  @override
  Future<void> changeIsFavorite(int movieId) async {
    await _moviesDataSource.changeIsFavorite(movieId);
  }

  @override
  ValueListenable<Box<DbMovie>> getFavoriteMoviesListenable() {
    return _moviesDataSource.getFavoriteMoviesListenable();
  }
}
