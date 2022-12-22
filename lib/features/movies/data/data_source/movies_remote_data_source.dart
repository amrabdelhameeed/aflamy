import 'package:aflamy/core/errors/execptions.dart';
import 'package:aflamy/core/errors/error_model.dart';
import 'package:aflamy/core/utils/app_constants.dart';
import 'package:aflamy/features/movies/data/models/actor_model.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/data/data_source/base_movies_remote_data_source.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:dio/dio.dart';

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<MoviesResponseModel> getNowPlaying() async {
    final response =
        await sl<Dio>().get("${AppConstants.nowPlaying}&language=en-US&page=1");
    if (response.statusCode == 200) {
      // print(response.data);
      return MoviesResponseModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseModel> getPopularMovies() async {
    final response =
        await sl<Dio>().get("${AppConstants.popular}&language=en-US&page=1");
    if (response.statusCode == 200) {
      return MoviesResponseModel.fromJson(response.data);
    } else {
      throw ServerExceptions(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseModel> getTopRated() async {
    final response =
        await sl<Dio>().get("${AppConstants.topRated}&language=en-US&page=1");
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
