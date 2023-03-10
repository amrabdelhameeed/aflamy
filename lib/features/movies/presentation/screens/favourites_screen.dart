import 'package:flutter/material.dart';

import '../../../../core/utils/database_provider.dart';
import '../components/movies_gridview.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MoviesGridView(moviesIds: DatabaseProvider.favourites());
  }
}
