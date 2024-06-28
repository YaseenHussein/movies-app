class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String appKey = "8d6e421d9e3c4e1e4bc91da3f517d3d2";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$appKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$appKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$appKey";

  static String moviesDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$appKey";

  static String recommendationsMoviesPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$appKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
