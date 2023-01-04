import 'package:aflamy/core/utils/app_colors.dart';
import 'package:aflamy/core/utils/assets.dart';
import 'package:aflamy/features/movies/presentation/components/trend_button.dart';
import 'package:aflamy/features/movies/presentation/controller/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:aflamy/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/favourites_screen.dart';
import 'package:aflamy/features/movies/presentation/screens/home_screen.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

List<Widget> screens = const [Home(), FavouriteScreen()];
List<Widget> titles = [
  Image.asset(Assets.assetsImagesAppIcon,
      width: 23, height: 33, fit: BoxFit.cover),
  const Text("Favorites")
];

class _HomeLayoutState extends State<HomeLayout> {
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
            floatingActionButton: const TrendButton(),
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
