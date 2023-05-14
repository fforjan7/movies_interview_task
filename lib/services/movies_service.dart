import 'package:dio/dio.dart';
import 'package:movies_interview_task/services/rest_client.dart';

import '../common/enums/api_endpoints_enum.dart';
import '../data/models/responses/genres_response.dart';
import '../data/models/responses/popular_movies_response.dart';
import '../utils/server_exception.dart';

abstract class IMoviesService {
  Future<GenresResponse> fetchGenres();
  Future<PopularMoviesResponse> fetchPopularMovies(int page);
}

class MoviesService implements IMoviesService {
  final RestClient _restClient;

  MoviesService(this._restClient);

  @override
  Future<GenresResponse> fetchGenres() async {
    try {
      return await _restClient.fetchGenres();
    } catch (e) {
      if (e is DioError) {
        throw ServerException(
          statusCode: e.response?.statusCode ?? 0,
          endpointEnum: ApiEndpointsEnum.fetchGenres,
        );
      }
      rethrow;
    }
  }

  @override
  Future<PopularMoviesResponse> fetchPopularMovies(int page) async {
    try {
      return await _restClient.fetchPopularMovies(page);
    } catch (e) {
      if (e is DioError) {
        throw ServerException(
          statusCode: e.response?.statusCode ?? 0,
          endpointEnum: ApiEndpointsEnum.fetchPopularMovies,
        );
      }
      rethrow;
    }
  }
}
