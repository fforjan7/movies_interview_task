import 'package:movies_interview_task/services/rest_client.dart';

import '../data/models/responses/genres_response.dart';
import '../data/models/responses/popular_movies_response.dart';

class MoviesService {
  final RestClient _restClient;

  MoviesService(this._restClient);

  Future<GenresResponse> fetchGenres() async {
    return await _restClient.fetchGenres();
  }

  Future<PopularMoviesResponse> getPopularMovies(int page) async {
    return _restClient.fetchPopularMovies(page);
  }
}
