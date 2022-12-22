import 'package:aflamy/core/utils/app_constants.dart';
import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';

class MoviesResponseModel extends MoviesResponse {
  const MoviesResponseModel(
      {required super.page,
      required super.movies,
      required super.totalPages,
      required super.totalmovies});
  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
        page: json['page'] ?? 0,
        movies: List.from(json['results'] ?? const <String, dynamic>{})
            .map((movie) => MovieModel.fromJson(movie))
            .toList(),
        totalPages: json['total_pages'] ?? 0,
        totalmovies: json['total_results'] ?? 0);
  }
}

class MovieModel extends Movie {
  bool? isFavourite;
  MovieModel(
      {this.isFavourite = false,
      required super.adult,
      required super.backdropPath,
      required super.id,
      required super.geners,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.video,
      required super.voteAverage,
      required super.voteCount});
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        geners: List<int>.from(json['genreIds'] ?? const []),
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] == null
            ? ""
            : AppConstants.baseURLForImages + json['backdrop_path'],
        id: json['id'] ?? -1,
        isFavourite: DatabaseProvider.isFavourite(json['id'] ?? -1),
        originalLanguage: json['original_language'] ?? "",
        originalTitle: json['original_title'] ?? "",
        overview: json['overview'] ?? "",
        popularity: json['popularity'] ?? 0.0,
        posterPath: json['poster_path'] ?? "",
        releaseDate: json['release_date'] ?? "",
        title: json['title'] ?? "",
        video: json['video'] ?? false,
        voteAverage: json['vote_average'].toDouble() ?? 0.0,
        voteCount: json['vote_count'] ?? 0);
  }
}
