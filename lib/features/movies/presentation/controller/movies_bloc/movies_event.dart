part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetTrendingEvent extends MoviesEvent {
  const GetTrendingEvent({this.page = 1});
  final int page;
  @override
  List<Object> get props => [page];
}

class GetUpComingEvent extends MoviesEvent {
  const GetUpComingEvent({this.page = 1});
  final int page;
  @override
  List<Object> get props => [page];
}

class GetNowPlayingEvent extends MoviesEvent {
  const GetNowPlayingEvent({this.page = 1});
  final int page;
  @override
  List<Object> get props => [page];
}

class GetAllGenresEvent extends MoviesEvent {
  const GetAllGenresEvent();
  @override
  List<Object> get props => [];
}

class GetMoviesByGenresIdEvent extends MoviesEvent {
  final int id;
  final int index;
  final int page;
  const GetMoviesByGenresIdEvent({this.id = -1, this.index = 0, this.page = 1});
  @override
  List<Object> get props => [id, index];
}
