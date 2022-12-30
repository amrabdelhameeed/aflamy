import '../models/movies_response_model.dart';

import '../../../../core/utils/parameters/get_movie_by_genre_id_parameters.dart';

import '../../../../core/errors/execptions.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/utils/app_constants.dart';
import '../models/actor_model.dart';
import '../models/genre_model.dart';
import 'base_movies_remote_data_source.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:dio/dio.dart';

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<MoviesResponseModel> getNowPlaying(int page) async {
    final response = await sl<Dio>().get(AppConstants.nowPlaying(page));
    if (response.statusCode == 200) {
      return MoviesResponseModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseModel> getTrendingMovies(int page) async {
    final response = await sl<Dio>().get(AppConstants.trending(page));
    if (response.statusCode == 200) {
      return MoviesResponseModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseModel> getUpComing(int page) async {
    final response = await sl<Dio>().get("${AppConstants.upComing(page)}");
    if (response.statusCode == 200) {
      return MoviesResponseModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<GenreModel>> getAllgenres() async {
    final response = await sl<Dio>().get(AppConstants.genres);
    if (response.statusCode == 200) {
      return List.from(response.data["genres"])
          .map((e) => GenreModel.fromJson(e))
          .toList()
        ..insert(0, GenreModel(-1, "All"));
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseModel> getMoviesByGenreId(int id) async {
    final response =
        await sl<Dio>().get(AppConstants.getMoviesByGenreId(id: id));
    if (response.statusCode == 200) {
      return MoviesResponseModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ActorModel>> getAllActors(int id) async {
    final response = await sl<Dio>().get(AppConstants.getCastByMovieId(id));
    if (response.statusCode == 200) {
      return List.from(response.data["cast"])
          .map((e) => ActorModel.fromJson(e))
          .toList();
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int id) async {
    final response = await sl<Dio>().get(AppConstants.getMovieDetailsById(id));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
