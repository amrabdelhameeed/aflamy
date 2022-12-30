import '../../../../core/utils/enums.dart';
import 'movie_item.dart';
import '../controller/movie_details_bloc/movie_details_bloc.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.moviesIds});
  final List moviesIds; // 12,5,9897
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: moviesIds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 0.8),
      itemBuilder: (context, index) {
        return BlocProvider(
          create: (context) => MovieDetailsBloc(sl(), sl())
            ..add(GetMovieDetailsEvent(moviesIds[index])),
          child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state.movieRequestState == RequestState.loaded &&
                  state.movie!.backdropPath != null) {
                return MovieItem(
                  movie: state.movie!,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }
}
