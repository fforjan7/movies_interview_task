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
  final MoviesService moviesService;
  final Box<DbGenre> genresBox;
  final Box<DbMovie> moviesBox;
  final Box<DbMovie> favoriteMoviesBox;

  MoviesRepository({
    required this.moviesService,
    required this.genresBox,
    required this.moviesBox,
    required this.favoriteMoviesBox,
  });

  @override
  Future<void> saveGenresToDb() async {
    final genresResponse = await moviesService.fetchGenres();
  }

  @override
  Future<void> saveMoviesPageToDb(int page) async {
    final popularMoviesResponse = await moviesService.getPopularMovies(page);
    //create4 box and shits
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
