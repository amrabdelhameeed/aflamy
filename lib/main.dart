import 'package:aflamy/core/utils/app_database_keys.dart';
import 'package:aflamy/core/utils/themes.dart';
import 'package:aflamy/features/movies/presentation/screens/fake_screen.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

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
          home: FakeScreen(),
        );
      },
    );
  }
}

// _initHiveBox in void main
Future<void> _initHiveBoxes() async {
  final dbPath = await path.getApplicationDocumentsDirectory();
  Hive.init(dbPath.path);
  await Hive.openBox<int>(AppDatabaseKeys.favouritesKey).then((box) {
    if (box.isEmpty) {
      // box.put(1, true);
      print("done ya basha ahmed");
    }
  });
}
