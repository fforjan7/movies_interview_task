import 'package:movies_interview_task/services/rest_client.dart';

import '../data/models/responses/genres_response.dart';
import '../data/models/responses/popular_movies_response.dart';

class MoviesService {
  final RestClient _restClient;

  MoviesService(this._restClient);

  Future<GenresResponse> fetchGenres() async {
    try {
      return await _restClient.fetchGenres();
    } catch (e) {
      rethrow;
    }
  }

  Future<PopularMoviesResponse> getPopularMovies(int page) async {
    try {
      return await _restClient.fetchPopularMovies(page);
    } catch (e) {
      rethrow;
    }
  }
}
