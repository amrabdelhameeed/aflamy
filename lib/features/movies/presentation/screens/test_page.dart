import 'package:aflamy/core/utils/database_provider.dart';
import 'package:aflamy/core/utils/enums.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/presentation/components/favourite_item.dart';
import 'package:aflamy/features/movies/presentation/components/movie_item.dart';
import 'package:aflamy/features/movies/presentation/components/movies_gridview.dart';
import 'package:aflamy/features/movies/presentation/controller/favourites_bloc/favourites_bloc.dart';
import 'package:aflamy/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:aflamy/service_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key, required this.moviesIds});
  final List moviesIds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Favourites"),
      ),
      body: MoviesGridView(moviesIds: DatabaseProvider.favourites()),
    );
  }
}
