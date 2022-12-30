import '../features/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../features/movies/data/data_source/base_movies_remote_data_source.dart';
import '../features/movies/data/data_source/movies_remote_data_source.dart';
import '../features/movies/data/reposetories/movie_repository.dart';
import '../features/movies/domain/repositories/base_movies_repository.dart';
import '../features/movies/domain/usecases/get_all_actors_usecase.dart';
import '../features/movies/domain/usecases/get_all_genres_usecase.dart';
import '../features/movies/domain/usecases/get_movie_details_usecase.dart';
import '../features/movies/domain/usecases/get_movies_by_genre_id_usecase.dart';
import '../features/movies/domain/usecases/get_now_playing_usecase.dart';
import '../features/movies/domain/usecases/get_trending_usecase.dart';
import '../features/movies/domain/usecases/get_up_coming_usecase.dart';
import '../features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import '../features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton<Dio>(() => _dio());
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
    sl.registerLazySingleton<MoviesBloc>(() => MoviesBloc(
          getAllGenresUseCase: sl(),
          getMoviesByGenreIdUsecase: sl(),
          getTrendingUseCase: sl(),
          getUpComingUseCase: sl(),
          nowPlayingUseCase: sl(),
        ));

    // sl.registerLazySingleton<FavouritesState>(() => const FavouritesState());
    sl.registerLazySingleton<FavouritesBloc>(() => FavouritesBloc());
    // sl.registerLazySingleton<MoviesBloc>(() => MoviesBloc(
    //     getMoviesByGenreIdUsecase: sl(),
    //     getAllGenresUseCase: sl(),
    //     getTrendingUseCase: sl(),
    //     getUpComingUseCase: sl(),
    //     nowPlayingUseCase: sl()));
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
    sl.registerSingleton<GetTrendingUseCase>(GetTrendingUseCase(sl()));
    sl.registerSingleton<GetUpComingUseCase>(GetUpComingUseCase(sl()));
  }

  static Dio _dio() {
    return Dio()
      ..options.connectTimeout = 5000
      ..options.receiveTimeout = 15 * 1000
      ..interceptors.add(LogInterceptor(
        // requestBody: true,
        error: true,
        // responseBody: true,
        //requestHeader: true,
        request: true,
        //responseHeader: true
      ));
  }
}
