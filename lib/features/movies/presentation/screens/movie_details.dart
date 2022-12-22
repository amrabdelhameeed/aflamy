import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:aflamy/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
          ),
          BlocProvider(
            create: (context) =>
                sl<MovieDetailsBloc>()..add(GetAllActorsEvent(movie.id)),
            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state.castRequestState == RequestState.loaded) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: state.cast!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(state.cast![index].name!);
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
        ],
      )),
    );
  }
}
