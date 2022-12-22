class AppConstants {
  static const _baseURL = "https://api.themoviedb.org/3";
  static const baseURLForImages = "https://image.tmdb.org/t/p/w500";
  static const _apiKey = "api_key=daed77e6f8902a0e92913f7e5bd54310";
  static const _apiKey2 = "api_key=aba1050f6a51311e058387929c92531c";

  static const nowPlaying = "$_baseURL/movie/now_playing?$_apiKey";
  static const popular = "$_baseURL/movie/popular/$_apiKey";
  static const topRated = "$_baseURL/movie/top_rated/$_apiKey";
  static const genres = "$_baseURL/genre/movie/list?$_apiKey&language=en-US";
  static getMoviesByGenreId({int id = -1}) =>
      "$_baseURL/discover/movie?$_apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&${id != -1 ? "with_genres=$id&" : ""}with_watch_monetization_types=flatrate";
  static getCastByMovieId(int id) =>
      "$_baseURL/movie/$id/credits?$_apiKey&language=en-US";
  static getMovieDetailsById(int id) =>
      "$_baseURL/movie/$id?$_apiKey&language=en-US";
}
