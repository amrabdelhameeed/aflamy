import 'package:aflamy/features/movies/domain/entites/movies_response.dart';
import 'package:aflamy/features/movies/presentation/components/cached_image_with_shimmer.dart';
import 'package:aflamy/features/movies/presentation/components/favourite_icon.dart';
import 'package:aflamy/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => MovieDetailsScreen(movie: movie))),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Hero(
              tag: movie.backdropPath!,
              child: CachedImageWithShimmer(imageUrl: movie.backdropPath!),
            ),
            Positioned(
                top: 5,
                right: 5,
                child: FavouriteIcon(
                  movie: movie,
                ))
          ],
        ),
      ),
    );
  }
}
