import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/features/movies/presentation/components/up_coming_carousel.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/movie_details.dart';
import 'package:aflamy/features/movies/presentation/screens/trending_screen.dart';

import '../../../../core/app_widgets/title_with_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/custom_icons_icons.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entites/now_playing_response.dart';
import '../components/categories_chips.dart';
import '../components/movies_listview.dart';
import '../controller/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import 'test_page.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FakeScreen extends StatefulWidget {
  const FakeScreen({super.key});

  @override
  State<FakeScreen> createState() => _FakeScreenState();
}

List<Widget> screens = const [Home(), TestPage()];
List<Widget> titles = [
  Image.asset(Assets.assetsImagesAppIcon,
      width: 23, height: 33, fit: BoxFit.cover),
  const Text("Favouritses")
];

class _FakeScreenState extends State<FakeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarBloc()),
        BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(const GetNowPlayingEvent())
            ..add(const GetUpComingEvent(page: 1))
            ..add(const GetMoviesByGenresIdEvent())
            ..add(const GetAllGenresEvent())
            ..add(const GetTrendingEvent()),
        )
      ],
      child: BlocBuilder<BottomNavBarBloc, ChangeBottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(AppColor.mainColor),
            bottomNavigationBar: CustomBottomNavBar(
              curIndex: state.index,
              onTap: (index) {
                context
                    .read<BottomNavBarBloc>()
                    .add(ChangeBottomNavBarEvent(index));
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: TrendButton(),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              toolbarHeight: 40,
              title: titles[state.index],
            ),
            body: screens[state.index],
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state.nowPlayingRequestState == RequestState.loaded) {
              return TitleWithWidget(
                  title: "Now Playing",
                  widget: NowPlayingCarousel(
                    movies: state.nowPlayingResponse!,
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        // const SizedBox(
        //   height: 30,
        // ),
        BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if ((state.upComingResponse != null &&
                state.upComingResponse!.isNotEmpty)) {
              return TitleWithWidget(
                  title: "Up Coming",
                  widget: MoviesListView(
                    fetchPages: (page) async {
                      BlocProvider.of<MoviesBloc>(context)
                          .add(GetUpComingEvent(page: page));
                    },
                    page: state.upComingResponse!.length ~/ 20,
                    movies: state.upComingResponse!,
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        // BlocBuilder<MoviesBloc, MoviesState>(
        //   builder: (context, state) {
        //     if (state.nowPlayingRequestState == RequestState.loaded) {
        //       return TitleWithWidget(
        //           title: "Now Playing",
        //           widget: MoviesListView(
        //             movies: state.nowPlayingResponse!.movies!,
        //           ));
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        const CategoriesChips(),
        // const SizedBox(
        //   height: 40,
        // )
      ],
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
              return BlocProvider.value(
                value: sl<MoviesBloc>(),
                child: const TrendingScreen(),
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
  final void Function(int index)? onTap;
  const CustomBottomNavBar(
      {Key? key, required this.curIndex, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
          backgroundColor: const Color(AppColor.mainColor),
          currentIndex: curIndex,
          onTap: onTap,
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
