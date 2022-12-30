import '../../../../core/utils/parameters/get_movie_by_genre_id_parameters.dart';

import '../models/actor_model.dart';
import '../models/genre_model.dart';
import '../models/now_playing_response_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<MoviesResponseModel> getNowPlaying(int page);
  Future<MoviesResponseModel> getTrendingMovies(int page);
  Future<MoviesResponseModel> getUpComing(int page);
  Future<List<GenreModel>> getAllgenres();
  Future<MoviesResponseModel> getMoviesByGenreId(int id);
  Future<List<ActorModel>> getAllActors(int id);
  Future<MovieModel> getMovieDetails(int id);
}
