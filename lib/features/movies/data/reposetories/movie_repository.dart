import 'package:aflamy/core/errors/execptions.dart';
import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/data_source/base_movies_remote_data_source.dart';
import 'package:aflamy/features/movies/data/models/actor_model.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MovieRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, MoviesResponseModel>> getNowPlaying() async {
    // return await baseMoviesRemoteDataSource.getNowPlaying();
    final response = await baseMoviesRemoteDataSource.getNowPlaying();
    try {
      print(response.totalmovies);
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseModel>> getPopularNow() async {
    final response = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseModel>> getTopRated() async {
    final response = await baseMoviesRemoteDataSource.getTopRated();
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<GenreModel>>> getAllgenres() async {
    final response = await baseMoviesRemoteDataSource.getAllgenres();
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseModel>> getMoviesByGenreId(
      int id) async {
    final response = await baseMoviesRemoteDataSource.getMoviesByGenreId(id);
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ActorModel>>> getAllActors(int id) async {
    final response = await baseMoviesRemoteDataSource.getAllActors(id);
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieModel>> getMovieDetails(int id) async {
    final response = await baseMoviesRemoteDataSource.getMovieDetails(id);
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }
}
