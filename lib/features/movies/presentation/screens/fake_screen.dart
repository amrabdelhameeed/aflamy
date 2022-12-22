import 'package:aflamy/core/app_widgets/title_with_widget.dart';
import 'package:aflamy/core/utils/app_colors.dart';
import 'package:aflamy/core/utils/app_strings.dart';
import 'package:aflamy/core/utils/assets.dart';
import 'package:aflamy/core/utils/custom_icons_icons.dart';
import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/data/data_source/movies_remote_data_source.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/usecases/get_all_genres_usecase.dart';
import 'package:aflamy/features/movies/presentation/components/categories_chips.dart';
import 'package:aflamy/features/movies/presentation/components/movies_listview.dart';
import 'package:aflamy/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/test_page.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FakeScreen extends StatefulWidget {
  const FakeScreen({super.key});

  @override
  State<FakeScreen> createState() => _FakeScreenState();
}

class _FakeScreenState extends State<FakeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColor.mainColor),
      bottomNavigationBar: const CustomBottomNavBar(curIndex: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const TrendButton(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 40,
        title: Image.asset(Assets.assetsImagesAppIcon,
            width: 23, height: 33, fit: BoxFit.cover),
      ),
      body: BlocProvider<MoviesBloc>(
        create: (context) => MoviesBloc(
            getMoviesByGenreIdUsecase: sl(),
            getAllGenresUseCase: sl(),
            getPopularUseCase: sl(),
            getTopRatedUseCase: sl(),
            nowPlayingUseCase: sl())
          ..add(const GetNowPlayingEvent())
          ..add(const GetAllGenresEvent())
          ..add(const GetMoviesByGenresIdEvent()),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.nowPlayingRequestState == RequestState.loaded) {
                  return TitleWithWidget(
                      title: "Up Coming",
                      widget: HomeMainCarousel(
                        movies: state.nowPlayingResponse!.movies!,
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.nowPlayingRequestState == RequestState.loaded) {
                  return TitleWithWidget(
                      title: "Up Coming",
                      widget: MoviesListView(
                        movies: state.nowPlayingResponse!.movies!,
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const CategoriesChips(),
          ],
        )),
      ),
    );
  }
}

class HomeMainCarousel extends StatelessWidget {
  final List<Movie> movies;
  const HomeMainCarousel({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List<Widget>.generate(
            5,
            (index) => Container(
                  height: 160,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000",
                          ),
                          fit: BoxFit.cover)),
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

class TrendButton extends StatelessWidget {
  const TrendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: FloatingActionButton(
        elevation: 0.0,
        child: const CircleAvatar(
          radius: 60,
          backgroundColor: Color(AppColor.mainColor),
          backgroundImage: AssetImage(
            Assets.assetsImagesFloatingActionButton,
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TestPage(
                moviesIds: DatabaseProvider.favourites(),
              );
            },
          ));
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int curIndex;
  const CustomBottomNavBar({Key? key, required this.curIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
          backgroundColor: const Color(AppColor.mainColor),
          currentIndex: curIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.popCorn), label: AppStrings.movies),
            BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.favFalse,
                ),
                label: AppStrings.favourites)
          ]),
    );
  }
}
