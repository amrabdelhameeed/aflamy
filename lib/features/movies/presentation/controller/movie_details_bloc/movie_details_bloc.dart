import '../../../domain/entites/movies_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/actor_model.dart';
import '../../../domain/usecases/get_all_actors_usecase.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetAllActorsUseCase getAllActorsUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsBloc(this.getAllActorsUseCase, this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetAllActorsEvent>((event, emit) async {
      emit(state.copyWith(castRequestState: RequestState.loading));
      final result = await getAllActorsUseCase(event.id!);
      result.fold(
          (l) => {
                emit(state.copyWith(
                    castMessage: l.message,
                    castRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    castRequestState: RequestState.loaded, cast: r))
              });
    });
    on<GetMovieDetailsEvent>((event, emit) async {
      emit(state.copyWith(movieRequestState: RequestState.loading));
      final result = await getMovieDetailsUseCase(event.id!);
      result.fold(
          (l) => {
                emit(state.copyWith(
                    movieMessage: l.message,
                    movieRequestState: RequestState.error))
              },
          (r) => {
                emit(state.copyWith(
                    movieRequestState: RequestState.loaded, movie: r))
              });
    });
  }
}
