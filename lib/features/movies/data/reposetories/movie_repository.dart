import 'package:aflamy/core/utils/parameters/get_movie_by_genre_id_parameters.dart';

import '../../../../core/errors/execptions.dart';
import '../../../../core/errors/failure.dart';
import '../data_source/base_movies_remote_data_source.dart';
import '../models/actor_model.dart';
import '../models/genre_model.dart';
import '../models/now_playing_response_model.dart';
import '../../domain/repositories/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MovieRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, MoviesResponseModel>> getNowPlaying(int page) async {
    // return await baseMoviesRemoteDataSource.getNowPlaying();
    final response = await baseMoviesRemoteDataSource.getNowPlaying(page);
    try {
      print(response.totalmovies);
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseModel>> getTrendingNow(int page) async {
    final response = await baseMoviesRemoteDataSource.getTrendingMovies(page);
    try {
      return Right(response);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseModel>> getUpComing(int page) async {
    final response = await baseMoviesRemoteDataSource.getUpComing(page);
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
