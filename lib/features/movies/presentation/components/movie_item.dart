import 'package:aflamy/core/utils/custom_icons_icons.dart';
import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/presentation/components/movies_listview.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/movie_details.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key, required this.movie, required this.onDelete})
      : super(key: key);

  final MovieModel movie;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MovieDetails(movie: movie);
            },
          ));
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              CachedNetworkImage(
                width: 170.0,
                fit: BoxFit.cover,
                imageUrl: movie.backdropPath!,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade800,
                  child: Container(
                    height: 200.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: BlocProvider<FavouritesBloc>.value(
                    value: sl<FavouritesBloc>(),
                    child: BlocBuilder<FavouritesBloc, FavouritesState>(
                      builder: (context, state) {
                        return IconButton(
                            color:
                                movie.isFavourite! ? Colors.red : Colors.white,
                            onPressed: onDelete,
                            icon: Icon(movie.isFavourite!
                                ? CustomIcons.favTrue
                                : CustomIcons.favFalse));
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
