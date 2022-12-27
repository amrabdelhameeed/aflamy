import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static final _light = ThemeData.light();
  static ThemeData light = ThemeData(
      // scaffold
      scaffoldBackgroundColor: Color(AppColor.mainColor),
      // app font family
      fontFamily: "Cairo",
      // text
      textTheme: TextTheme(
          headline4: _light.textTheme.headline4!.copyWith(
        fontFamily: "Cairo",
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      )),

      // bottom nav bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(height: 2.5.sp),
          unselectedItemColor: Colors.white38,
          selectedItemColor: Colors.white));
}
