import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/domain/entites/movies_response.dart';
import 'package:aflamy/features/movies/presentation/components/cached_image_with_shimmer.dart';
import 'package:aflamy/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastListView extends StatelessWidget {
  const CastListView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
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
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
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
    );
  }
}
