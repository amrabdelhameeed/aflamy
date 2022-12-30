import '../../domain/entites/movies_response.dart';

import '../../../../core/utils/custom_icons_icons.dart';
import '../../../../core/utils/database_provider.dart';
import '../controller/favourites_bloc/favourites_bloc.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouritesBloc>.value(
      value: sl<FavouritesBloc>(),
      child: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          return IconButton(
              color: DatabaseProvider.isFavourite(movie.id!)
                  ? Colors.red
                  : Colors.white,
              onPressed: () {
                context
                    .read<FavouritesBloc>()
                    .add(AddOrRemoveFavouriteEvent(movie.id));
              },
              icon: Icon(DatabaseProvider.isFavourite(movie.id!)
                  ? CustomIcons.favTrue
                  : CustomIcons.favFalse));
        },
      ),
    );
  }
}
