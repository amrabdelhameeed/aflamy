import '../../../../../core/utils/database_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(const FavouritesState()) {
    on<AddOrRemoveFavouriteEvent>((event, emit) async {
      final id = event.id;
      // print(state.hashCode);
      await DatabaseProvider.addOrRemoveFromFavourites(id!).then((isFavourite) {
        if (isFavourite) {
          emit(state.copyWith(id: id, isFavourite: isFavourite));
        } else {
          emit(state.copyWith(id: id, isFavourite: isFavourite));
        }
      });
    });
  }
}
