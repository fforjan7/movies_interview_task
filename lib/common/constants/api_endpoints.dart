abstract class ApiEndpoints {
  static String baseUrl = "https://api.themoviedb.org/3";

  //rest client
  static const String fetchGenres = '/genre/movie/list';
  static const String fetchPopularMovies = '/movie/popular';
}
