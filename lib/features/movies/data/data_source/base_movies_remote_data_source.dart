import 'package:aflamy/features/movies/data/models/actor_model.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<MoviesResponseModel> getNowPlaying();
  Future<MoviesResponseModel> getPopularMovies();
  Future<MoviesResponseModel> getTopRated();
  Future<List<GenreModel>> getAllgenres();
  Future<MoviesResponseModel> getMoviesByGenreId(int id);
  Future<List<ActorModel>> getAllActors(int id);
  Future<MovieModel> getMovieDetails(int id);
}
