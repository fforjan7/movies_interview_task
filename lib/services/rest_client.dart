import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';

import '../common/constants/constants.dart';
import '../data/models/responses/genres_response.dart';
import '../data/models/responses/popular_movies_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/3",
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 6),
      ),
    );

    /* dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      compact: true,
    )); */

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestBuilder, handler) {
          final token = dotenv.get(AppConstants.token);
          if (token != "") {
            requestBuilder.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(requestBuilder);
        },
      ),
    );

    return RestClient(dio);
  }

  @GET('/genre/movie/list')
  Future<GenresResponse> fetchGenres();

  @GET('/movie/popular')
  Future<PopularMoviesResponse> fetchPopularMovies(
    @Query("page") int page, [
    @Query("language") String language = AppConstants.languageUS,
  ]);
}
