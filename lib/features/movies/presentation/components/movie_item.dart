import '../../domain/entites/movies_response.dart';

import 'cached_image_with_shimmer.dart';
import 'favourite_icon.dart';
import '../screens/movie_details_screen.dart';
import 'package:flutter/material.dart';

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
