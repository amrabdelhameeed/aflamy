part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularEvent extends MoviesEvent {
  const GetPopularEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedEvent extends MoviesEvent {
  const GetTopRatedEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MoviesEvent {
  const GetNowPlayingEvent();

  @override
  List<Object> get props => [];
}

class GetAllGenresEvent extends MoviesEvent {
  const GetAllGenresEvent();
  @override
  List<Object> get props => [];
}

class GetMoviesByGenresIdEvent extends MoviesEvent {
  final int id;
  final int index;
  const GetMoviesByGenresIdEvent({this.id = -1, this.index = 0});
  @override
  List<Object> get props => [id, index];
}
