import 'package:aflamy/core/utils/custom_icons_icons.dart';
import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/movie_details.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCarousel extends StatelessWidget {
  final List<Movie> movies;
  const NowPlayingCarousel({
    Key? key,
    required this.movies,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List<Widget>.generate(
            5,
            (index) => GestureDetector(
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                  movies[index].backdropPath!,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          top: 5,
                          right: 5,
                          child: BlocProvider<FavouritesBloc>.value(
                            value: sl<FavouritesBloc>(),
                            child: BlocBuilder<FavouritesBloc, FavouritesState>(
                              builder: (context, state) {
                                return IconButton(
                                    color: DatabaseProvider.isFavourite(
                                            movies[index].id!)
                                        ? Colors.red
                                        : Colors.white,
                                    onPressed: () {
                                      context.read<FavouritesBloc>().add(
                                          AddOrRemoveFavouriteEvent(
                                              movies[index].id!));
                                    },
                                    icon: Icon(DatabaseProvider.isFavourite(
                                            movies[index].id!)
                                        ? CustomIcons.favTrue
                                        : CustomIcons.favFalse));
                              },
                            ),
                          ))
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MovieDetails(movie: movies[index]);
                      },
                    ));
                  },
                )),
        options: CarouselOptions(
          height: 160,
          aspectRatio: 12 / 9,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.15,
          scrollDirection: Axis.horizontal,
        ));
  }
}
