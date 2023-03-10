import 'package:aflamy/features/movies/presentation/screens/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as path;

import 'core/utils/app_database_keys.dart';
import 'core/utils/themes.dart';
import 'service_locator/services_locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHiveBoxes();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 916),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppThemes.light,
          debugShowCheckedModeBanner: false,
          title: "Aflamy",
          home: const HomeLayout(),
        );
      },
    );
  }
}

// _initHiveBox in void main
Future<void> _initHiveBoxes() async {
  final dbPath = await path.getApplicationDocumentsDirectory();
  Hive.init(dbPath.path);
  await Hive.openBox<int>(AppDatabaseKeys.favouritesKey);
}
