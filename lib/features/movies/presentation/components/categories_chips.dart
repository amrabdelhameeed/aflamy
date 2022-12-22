import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/presentation/components/movies_listview.dart';
import 'package:aflamy/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesChips extends StatelessWidget {
  const CategoriesChips({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MoviesBloc, MoviesState>(
          buildWhen: (previous, current) {
            return previous.genresRequestState != current.genresRequestState ||
                previous.moviesByGenreIdRequestState !=
                    current.moviesByGenreIdRequestState;
          },
          builder: (context, state) {
            // print("---------------------------------------");
            if (state.genresRequestState == RequestState.loaded) {
              final genres = state.genres!;
              var bloc = context.read<MoviesBloc>();
              return SizedBox(
                height: 70,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                  itemCount: genres.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ChoiceChip(
                      label: Text(genres[index].name),
                      selected: bloc.choiceIndex == index,
                      selectedColor: Colors.amber,
                      onSelected: (bool selected) {
                        bloc.add(GetMoviesByGenresIdEvent(
                            id: genres[index].id, index: index));
                      },
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                          color: bloc.choiceIndex != index
                              ? Colors.black
                              : Colors.white),
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
        BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state.moviesByGenreIdRequestState == RequestState.loaded) {
              return MoviesListView(movies: state.moviesByGenreId!.movies!);
            } else {
              return const SizedBox(
                height: 250,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
