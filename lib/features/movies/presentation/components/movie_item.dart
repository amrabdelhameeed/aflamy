import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/presentation/components/cached_image_with_shimmer.dart';
import 'package:aflamy/features/movies/presentation/components/favourite_icon.dart';

import '../../../../core/utils/custom_icons_icons.dart';
import '../../../../core/utils/database_provider.dart';
import '../../data/models/now_playing_response_model.dart';
import '../controller/favourites_bloc/favourites_bloc.dart';
import '../screens/movie_details.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;
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
              CachedImageWithShimmer(imageUrl: movie.backdropPath!),
              Positioned(top: 5, right: 5, child: FavouriteIcon(movie: movie))
            ],
          ),
        ),
      ),
    );
  }
}
