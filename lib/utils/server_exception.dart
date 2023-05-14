import 'package:movies_interview_task/utils/server_errors.dart';

import '../common/enums/api_endpoints_enum.dart';

class ServerException implements Exception {
  ServerException({required this.statusCode, required this.endpointEnum});

  final int statusCode;
  final ApiEndpointsEnum endpointEnum;

  String message() {
    switch (endpointEnum) {
      case (ApiEndpointsEnum.fetchPopularMovies):
        return ServerErrors.fetchPopularMovies(statusCode);
      case (ApiEndpointsEnum.fetchGenres):
        return ServerErrors.fetchGenres(statusCode);

      default:
        return ServerErrors.defaultError();
    }
  }
}
