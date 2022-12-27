import 'package:aflamy/core/utils/app_colors.dart';
import 'package:aflamy/core/utils/custom_icons_icons.dart';
import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/features/movies/presentation/components/cached_image_with_shimmer.dart';
import 'package:aflamy/features/movies/presentation/components/favourite_icon.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entites/now_playing_response.dart';
import '../controller/movie_details_bloc/movie_details_bloc.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(AppColor.mainColor),
            pinned: true,
            // snap: true,
            // floating: true,
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
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                      ),
                      child: Text(movie.voteAverage!.toStringAsFixed(1),
                          style:
                              TextStyle(color: Colors.white, fontSize: 27.sp)),
                    ),
                    Text("${movie.voteCount!} Reviews",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                    Text(
                      movie.overview!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              BlocProvider.value(
                value: sl<MovieDetailsBloc>()..add(GetAllActorsEvent(movie.id)),
                child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                  builder: (context, state) {
                    if (state.castRequestState == RequestState.loaded) {
                      return SizedBox(
                        height: 350,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.cast!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedImageWithShimmer(
                                    imageUrl: state.cast![index].profilePath!),
                                Text(
                                  state.cast![index].name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
