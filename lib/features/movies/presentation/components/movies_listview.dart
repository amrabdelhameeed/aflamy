import 'package:aflamy/core/utils/custom_icons_icons.dart';
import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/presentation/components/movie_item.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/movie_details.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({Key? key, required this.movies}) : super(key: key);
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocProvider<FavouritesBloc>.value(
        value: sl<FavouritesBloc>(),
        child: BlocBuilder<FavouritesBloc, FavouritesState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MovieItem(
                  movie: movies[index],
                  onDelete: () {
                    movies[index].isFavourite = !movies[index].isFavourite!;
                    context
                        .read<FavouritesBloc>()
                        .add(AddOrRemoveFavouriteEvent(movies[index].id));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// class AddToFavoutiteWidget extends StatelessWidget {
//   const AddToFavoutiteWidget({Key? key, required this.id}) : super(key: key);
//   final int id;
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
