import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/usecases/base_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_all_genres_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_movies_by_genre_id_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_popular_usecase.dart';
import 'package:aflamy/features/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetAllGenresUseCase getAllGenresUseCase;
  final GetMoviesByGenreIdUsecase getMoviesByGenreIdUsecase;
  final GetNowPlayingUseCase nowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  int choiceIndex = 0;
  MoviesBloc({
    required this.getMoviesByGenreIdUsecase,
    required this.nowPlayingUseCase,
    required this.getPopularUseCase,
    required this.getAllGenresUseCase,
    required this.getTopRatedUseCase,
  }) : super(const MoviesState()) {
    on<GetAllGenresEvent>((event, emit) async {
      emit(state.copyWith(genresRequestState: RequestState.loading));
      final resault = await getAllGenresUseCase.call(const NoParams());
      resault.fold(
          (left) => emit(state.copyWith(
              genresMessage: left.message,
              genresRequestState: RequestState.error)),
          (right) => emit(state.copyWith(
              genresRequestState: RequestState.loaded, genres: right)));
    });
    on<GetNowPlayingEvent>((event, emit) async {
      emit(state.copyWith(nowPlayingRequestState: RequestState.loading));
      final result = await nowPlayingUseCase(const NoParams());
      result.fold(
          (l) => {
                emit(state.copyWith(
                    nowPlayingMessage: l.message,
                    nowPlayingRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    nowPlayingRequestState: RequestState.loaded,
                    nowPlayingResponse: r))
              });
    });
    on<GetPopularEvent>((event, emit) async {
      emit(state.copyWith(nowPlayingRequestState: RequestState.loading));
      final result = await getPopularUseCase(const NoParams());
      result.fold(
          (l) => {
                emit(state.copyWith(
                    nowPlayingMessage: l.message,
                    nowPlayingRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    nowPlayingRequestState: RequestState.loaded,
                    nowPlayingResponse: r))
              });
    });
    on<GetTopRatedEvent>((event, emit) async {
      emit(state.copyWith(nowPlayingRequestState: RequestState.loading));
      final result = await getTopRatedUseCase(const NoParams());
      result.fold(
          (l) => {
                emit(state.copyWith(
                    nowPlayingMessage: l.message,
                    nowPlayingRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    nowPlayingRequestState: RequestState.loaded,
                    nowPlayingResponse: r))
              });
    });
    on<GetMoviesByGenresIdEvent>((event, emit) async {
      emit(state.copyWith(moviesByGenreIdRequestState: RequestState.loading));
      final result = await getMoviesByGenreIdUsecase(event.id);
      choiceIndex = event.index;
      result.fold(
          (l) => {
                emit(state.copyWith(
                    moviesByGenreIdMessage: l.message,
                    moviesByGenreIdRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    moviesByGenreIdRequestState: RequestState.loaded,
                    moviesByGenreId: r))
              });
    });
  }
}
