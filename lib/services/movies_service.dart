import 'package:movies_interview_task/services/rest_client.dart';

import '../data/models/responses/genres_response.dart';
import '../data/models/responses/popular_movies_response.dart';

abstract class IMoviesService {
  Future<GenresResponse> fetchGenres();
  Future<PopularMoviesResponse> getPopularMovies(int page);
}

class MoviesService implements IMoviesService {
  final RestClient _restClient;

  MoviesService(this._restClient);

  @override
  Future<GenresResponse> fetchGenres() async {
    try {
      return await _restClient.fetchGenres();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PopularMoviesResponse> getPopularMovies(int page) async {
    try {
      return await _restClient.fetchPopularMovies(page);
    } catch (e) {
      rethrow;
    }
  }
}
