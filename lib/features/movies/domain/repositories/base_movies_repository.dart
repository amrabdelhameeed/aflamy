import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/models/actor_model.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/usecases/get_movies_by_genre_id_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, MoviesResponseModel>> getNowPlaying();
  Future<Either<Failure, MoviesResponseModel>> getPopularNow();
  Future<Either<Failure, MoviesResponseModel>> getTopRated();
  Future<Either<Failure, List<GenreModel>>> getAllgenres();
  Future<Either<Failure, MoviesResponseModel>> getMoviesByGenreId(int id);
  Future<Either<Failure, List<ActorModel>>> getAllActors(int id);
  Future<Either<Failure, MovieModel>> getMovieDetails(int id);
}
