import 'package:aflamy/features/movies/presentation/components/cast_listview.dart';
import 'package:aflamy/features/movies/presentation/components/movie_details.dart';
import '../../domain/entites/movies_response.dart';
import '../../../../core/utils/app_colors.dart';
import '../components/cached_image_with_shimmer.dart';
import '../components/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(AppColor.mainColor),
            pinned: true,
            actions: [FavouriteIcon(movie: movie)],
            expandedHeight: 320.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(movie.title!,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp)),
              ),
              background: Hero(
                tag: movie.backdropPath!,
                child: CachedImageWithShimmer(
                    imageUrl: movie.backdropPath!,
                    isSliverAppBarBackground: true),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                [MovieDetails(movie: movie), CastListView(movie: movie)]),
          ),
        ],
      ),
    );
  }
}
