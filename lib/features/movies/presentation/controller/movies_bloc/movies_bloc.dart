import '../../../domain/entites/movies_response.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/genre_model.dart';
import '../../../domain/usecases/base_usecase.dart';
import '../../../domain/usecases/get_all_genres_usecase.dart';
import '../../../domain/usecases/get_movies_by_genre_id_usecase.dart';
import '../../../domain/usecases/get_now_playing_usecase.dart';
import '../../../domain/usecases/get_trending_usecase.dart';
import '../../../domain/usecases/get_up_coming_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetAllGenresUseCase getAllGenresUseCase;
  final GetMoviesByGenreIdUsecase getMoviesByGenreIdUsecase;
  final GetNowPlayingUseCase nowPlayingUseCase;
  final GetTrendingUseCase getTrendingUseCase;
  final GetUpComingUseCase getUpComingUseCase;
  int choiceIndex = 0;
  MoviesBloc({
    required this.getMoviesByGenreIdUsecase,
    required this.nowPlayingUseCase,
    required this.getTrendingUseCase,
    required this.getAllGenresUseCase,
    required this.getUpComingUseCase,
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
      final result = await nowPlayingUseCase(event.page);
      result.fold(
          (l) => {
                emit(state.copyWith(
                    nowPlayingMessage: l.message,
                    nowPlayingRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    nowPlayingRequestState: RequestState.loaded,
                    nowPlayingResponse: r.movies!)),
              });
    });
    on<GetTrendingEvent>((event, emit) async {
      emit(state.copyWith(trendingRequestState: RequestState.loading));
      final result = await getTrendingUseCase(event.page);
      result.fold(
          (l) => {
                emit(state.copyWith(
                    trendingMessage: l.message,
                    trendingRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    trendingRequestState: RequestState.loaded,
                    trendingResponse: [
                      ...state.trendingResponse ?? [],
                      ...r.movies ?? []
                    ]))
              });
    });
    on<GetUpComingEvent>((event, emit) async {
      emit(state.copyWith(upComingRequestState: RequestState.loading));
      final result = await getUpComingUseCase(event.page);
      result.fold(
          (l) => {
                emit(state.copyWith(
                    upComingMessage: l.message,
                    upComingRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    upComingRequestState: RequestState.loaded,
                    upComingResponse: [
                      ...state.upComingResponse ?? [],
                      ...r.movies ?? []
                    ]))
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
                    moviesByGenreId: r.movies))
              });
    });
  }
}
