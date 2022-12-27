part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie>? nowPlayingResponse;
  final String? nowPlayingMessage;
  final RequestState? nowPlayingRequestState;
  final List<Movie>? upComingResponse;
  final String? upComingMessage;
  final RequestState? upComingRequestState;
  final List<Movie>? trendingResponse;
  final String? trendingMessage;
  final RequestState? trendingRequestState;
  final List<Movie>? moviesByGenreId;
  final String? moviesByGenreIdMessage;
  final RequestState? moviesByGenreIdRequestState;
  final List<GenreModel>? genres;
  final String? genresMessage;
  final RequestState? genresRequestState;
  const MoviesState({
    this.nowPlayingResponse,
    this.nowPlayingMessage = '',
    this.nowPlayingRequestState = RequestState.loading,
    this.upComingResponse,
    this.upComingMessage = '',
    this.upComingRequestState = RequestState.loading,
    this.trendingResponse,
    this.trendingMessage = '',
    this.trendingRequestState = RequestState.loading,
    this.moviesByGenreId,
    this.moviesByGenreIdMessage = '',
    this.moviesByGenreIdRequestState = RequestState.loading,
    this.genres,
    this.genresMessage = '',
    this.genresRequestState = RequestState.loading,
  });
  @override
  List<Object?> get props => [
        trendingResponse,
        trendingMessage,
        trendingRequestState,
        upComingResponse,
        upComingMessage,
        upComingRequestState,
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
    List<Movie>? trendingResponse,
    String? trendingMessage,
    RequestState? trendingRequestState,
    List<Movie>? upComingResponse,
    String? upComingMessage,
    RequestState? upComingRequestState,
    List<Movie>? nowPlayingResponse,
    String? nowPlayingMessage,
    RequestState? nowPlayingRequestState,
    List<Movie>? moviesByGenreId,
    String? moviesByGenreIdMessage,
    RequestState? moviesByGenreIdRequestState,
    List<GenreModel>? genres,
    String? genresMessage,
    RequestState? genresRequestState,
  }) {
    return MoviesState(
        trendingResponse: trendingResponse ?? this.trendingResponse,
        trendingMessage: trendingMessage ?? this.trendingMessage,
        trendingRequestState: trendingRequestState ?? this.trendingRequestState,
        upComingResponse: upComingResponse ?? this.upComingResponse,
        upComingMessage: upComingMessage ?? this.upComingMessage,
        upComingRequestState: upComingRequestState ?? this.upComingRequestState,
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
