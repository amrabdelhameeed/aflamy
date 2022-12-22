import 'package:aflamy/features/movies/data/data_source/base_movies_remote_data_source.dart';
import 'package:aflamy/features/movies/data/data_source/movies_remote_data_source.dart';
import 'package:aflamy/features/movies/data/reposetories/movie_repository.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:aflamy/features/movies/domain/usecases/get_all_actors_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_all_genres_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_movies_by_genre_id_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_popular_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:aflamy/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton<Dio>(() => _dio());
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
    // sl.registerLazySingleton<FavouritesState>(() => const FavouritesState());
    sl.registerLazySingleton<FavouritesBloc>(() => FavouritesBloc());
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    sl.registerSingleton<GetMoviesByGenreIdUsecase>(
        GetMoviesByGenreIdUsecase(sl()));
    // sl.registerLazySingleton<MovieDetailsBloc>(() => MovieDetailsBloc(sl(), sl()))
    sl.registerLazySingleton<MovieDetailsBloc>(
        () => MovieDetailsBloc(sl(), sl()));
    sl.registerSingleton<GetMovieDetailsUseCase>(GetMovieDetailsUseCase(sl()));
    sl.registerSingleton<GetAllGenresUseCase>(GetAllGenresUseCase(sl()));
    sl.registerSingleton<GetAllActorsUseCase>(GetAllActorsUseCase(sl()));
    sl.registerSingleton<GetNowPlayingUseCase>(GetNowPlayingUseCase(sl()));
    sl.registerSingleton<GetPopularUseCase>(GetPopularUseCase(sl()));
    sl.registerSingleton<GetTopRatedUseCase>(GetTopRatedUseCase(sl()));
  }

  static Dio _dio() {
    return Dio()
      ..options.connectTimeout = 5000
      ..options.receiveTimeout = 15 * 1000
      ..interceptors.add(LogInterceptor(
        //requestBody: true,
        error: true,
        responseBody: true,
        //requestHeader: true,
        // request: true,
        //responseHeader: true
      ));
  }
}
