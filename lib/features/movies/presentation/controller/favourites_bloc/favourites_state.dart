part of 'favourites_bloc.dart';

class FavouritesState extends Equatable {
  const FavouritesState({this.id = -1, this.isFavourite = false});
  // added this 2 parameters to reduce nimber of objects created
  final int? id;
  final bool? isFavourite;
  FavouritesState copyWith({
    int? id,
    bool? isFavourite,
  }) {
    return FavouritesState(
        id: id ?? this.id, isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [id, isFavourite];
}
