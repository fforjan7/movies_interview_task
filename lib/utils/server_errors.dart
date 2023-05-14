abstract class ServerErrors {
  static String defaultError() {
    return "Default error";
  }

  static String fetchPopularMovies(int statusCode) {
    switch (statusCode) {
      case (401):
        return "401 Unauthorized error occured while fetching movies";
      case (404):
        return "404 Not Found error occured while fetching movies";
      default:
        return "Default error occured while fetching movies";
    }
  }

  static String fetchGenres(int statusCode) {
    switch (statusCode) {
      case (401):
        return "401 Unauthorized error occured while fetching genres";
      case (404):
        return "404 Not Found error occured while fetching genres";
      default:
        return "Default error occured while fetching genres";
    }
  }
}
