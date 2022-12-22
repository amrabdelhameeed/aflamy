part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final MoviesResponse? nowPlayingResponse;
  final String? nowPlayingMessage;
  final RequestState? nowPlayingRequestState;
  final MoviesResponse? moviesByGenreId;
  final String? moviesByGenreIdMessage;
  final RequestState? moviesByGenreIdRequestState;
  final List<GenreModel>? genres;
  final String? genresMessage;
  final RequestState? genresRequestState;
  const MoviesState({
    this.nowPlayingResponse,
    this.nowPlayingMessage = '',
    this.nowPlayingRequestState = RequestState.loading,
    this.moviesByGenreId,
    this.moviesByGenreIdMessage = '',
    this.moviesByGenreIdRequestState = RequestState.loading,
    this.genres,
    this.genresMessage = '',
    this.genresRequestState = RequestState.loading,
  });
  @override
  List<Object?> get props => [
        nowPlayingResponse,
        nowPlayingMessage,
        nowPlayingRequestState,
        moviesByGenreId,
        moviesByGenreIdMessage,
        moviesByGenreIdRequestState,
        genres,
        genresMessage,
        genresRequestState
      ];
  MoviesState copyWith({
    MoviesResponse? nowPlayingResponse,
    String? nowPlayingMessage,
    RequestState? nowPlayingRequestState,
    MoviesResponse? moviesByGenreId,
    String? moviesByGenreIdMessage,
    RequestState? moviesByGenreIdRequestState,
    List<GenreModel>? genres,
    String? genresMessage,
    RequestState? genresRequestState,
  }) {
    return MoviesState(
        nowPlayingResponse: nowPlayingResponse ?? this.nowPlayingResponse,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingRequestState:
            nowPlayingRequestState ?? this.nowPlayingRequestState,
        genres: genres ?? this.genres,
        genresMessage: genresMessage ?? this.genresMessage,
        genresRequestState: genresRequestState ?? this.genresRequestState,
        moviesByGenreId: moviesByGenreId ?? this.moviesByGenreId,
        moviesByGenreIdMessage:
            moviesByGenreIdMessage ?? this.moviesByGenreIdMessage,
        moviesByGenreIdRequestState:
            moviesByGenreIdRequestState ?? this.moviesByGenreIdRequestState);
  }
}
