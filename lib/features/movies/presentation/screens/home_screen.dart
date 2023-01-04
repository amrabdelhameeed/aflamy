import '../components/up_coming_carousel.dart';
import 'trending_screen.dart';

import '../../../../core/app_widgets/title_with_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/custom_icons_icons.dart';
import '../../../../core/utils/enums.dart';
import '../components/categories_chips.dart';
import '../components/movies_listview.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        const CategoriesChips(),
      ],
    ));
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
