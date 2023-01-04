import 'package:aflamy/core/utils/app_colors.dart';
import 'package:aflamy/core/utils/assets.dart';
import 'package:aflamy/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:aflamy/features/movies/presentation/screens/trending_screen.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
