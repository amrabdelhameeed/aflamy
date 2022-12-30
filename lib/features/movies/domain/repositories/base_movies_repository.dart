import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/actor_model.dart';
import '../../data/models/genre_model.dart';
import '../../data/models/now_playing_response_model.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, MoviesResponseModel>> getNowPlaying(int page);
  Future<Either<Failure, MoviesResponseModel>> getTrendingNow(int page);
  Future<Either<Failure, MoviesResponseModel>> getUpComing(int page);
  Future<Either<Failure, List<GenreModel>>> getAllgenres();
  Future<Either<Failure, MoviesResponseModel>> getMoviesByGenreId(int id);
  Future<Either<Failure, List<ActorModel>>> getAllActors(int id);
  Future<Either<Failure, MovieModel>> getMovieDetails(int id);
}
