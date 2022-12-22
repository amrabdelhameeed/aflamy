import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/presentation/components/movie_item.dart';
import 'package:aflamy/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.moviesIds});
  final List<int> moviesIds;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
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
                  if (state.movieRequestState == RequestState.loaded) {
                    return MovieItem(
                      movie: state.movie!,
                      onDelete: () {
                        moviesIds.removeAt(index);
                        DatabaseProvider.addOrRemoveFromFavourites(
                            state.movie!.id!);
                        setState(
                          () {},
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
