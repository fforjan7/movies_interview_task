import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/models/persistence/db_genre.dart';

import '../../services/movies_service.dart';
import '../models/persistence/db_movie.dart';

abstract class IMoviesRepository {
  Future<void> saveGenresToDb();
  Future<void> saveMoviesPageToDb(int page);
  Future<void> setMovieAsFavorite(int movieId);
  Future<void> removeMovieFromFavorites(int movieId);
  Future<List<DbGenre>> getGenresFromDb();
  Future<List<DbMovie>> getMoviesFromDb();
  Future<List<DbMovie>> getFavoriteMoviesFromDb();
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

  @override
  Future<void> saveGenresToDb() async {
    final genresResponse = await _moviesService.fetchGenres();
  }

  @override
  Future<void> saveMoviesPageToDb(int page) async {
    final popularMoviesResponse = await _moviesService.getPopularMovies(page);
  }

  @override
  Future<void> setMovieAsFavorite(int movieId) async {}

  @override
  Future<void> removeMovieFromFavorites(int movieId) async {}

  @override
  Future<List<DbGenre>> getGenresFromDb() async {
    return [];
  }

  @override
  Future<List<DbMovie>> getMoviesFromDb() async {
    return [];
  }

  @override
  Future<List<DbMovie>> getFavoriteMoviesFromDb() async {
    return [];
  }
}
