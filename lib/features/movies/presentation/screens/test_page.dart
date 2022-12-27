import '../../../../core/utils/database_provider.dart';
import '../components/movies_gridview.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MoviesGridView(moviesIds: DatabaseProvider.favourites());
  }
}
