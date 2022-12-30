part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final RequestState? movieRequestState;
  final String? movieMessage;
  final Movie? movie;
  final RequestState? castRequestState;
  final String? castMessage;
  final List<ActorModel>? cast;
  const MovieDetailsState(
      {this.movieRequestState = RequestState.loading,
      this.movieMessage = "",
      this.movie,
      this.castRequestState = RequestState.loading,
      this.castMessage = "",
      this.cast});
  MovieDetailsState copyWith({
    RequestState? movieRequestState,
    String? movieMessage,
    Movie? movie,
    RequestState? castRequestState,
    String? castMessage,
    List<ActorModel>? cast,
  }) {
    return MovieDetailsState(
      movieRequestState: movieRequestState ?? this.movieRequestState,
      movieMessage: movieMessage ?? this.movieMessage,
      movie: movie ?? this.movie,
      castRequestState: castRequestState ?? this.castRequestState,
      castMessage: castMessage ?? this.castMessage,
      cast: cast ?? this.cast,
    );
  }

  @override
  List<Object?> get props => [
        movieRequestState,
        movieMessage,
        movie,
        castRequestState,
        castMessage,
        cast
      ];
}
