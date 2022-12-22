part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class AddOrRemoveFavouriteEvent extends FavouritesEvent {
  const AddOrRemoveFavouriteEvent(this.id);
  final int? id;
  @override
  List<Object> get props => [id!];
}
