abstract class AppConstants {
  static const token = 'TOKEN_SECRET';
  static const apiKey = 'API_KEY_SECRET';
  static const languageUS = "en_US";
  static const genreTypeAdapterId = 0;
  static const moviesTypeAdapterId = 1;

  //poster and backdrop image
  static const String _imagesBaseUrl = "https://image.tmdb.org/t/p/w500";
  static String getFullImagePath(String path) {
    var url = "$_imagesBaseUrl/$path";
    return url;
  }
}
