part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetAllActorsEvent extends MovieDetailsEvent {
  const GetAllActorsEvent(this.id);
  final int? id;
  @override
  List<Object> get props => [id!];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  const GetMovieDetailsEvent(this.id);
  final int? id;
  @override
  List<Object> get props => [id!];
}
