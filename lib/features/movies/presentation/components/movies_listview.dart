import '../../../../core/utils/enums.dart';
import '../../domain/entites/now_playing_response.dart';
import '../../domain/usecases/base_usecase.dart';
import '../../domain/usecases/get_now_playing_usecase.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../../../../service_locator/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_item.dart';
import 'package:flutter/material.dart';

class MoviesListView extends StatefulWidget {
  const MoviesListView(
      {Key? key,
      required this.movies,
      required this.page,
      required this.fetchPages})
      : super(key: key);
  final List<Movie> movies;
  final int page;
  final Function fetchPages;
  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await widget.fetchPages(widget.page + 1);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: widget.movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MovieItem(
            movie: widget.movies[index],
          );
        },
      ),
    );
  }
}

// class _MoviesListViewState extends State<MoviesListView> {
//   final PagingController<int, MovieModel> _pagingController =
//       PagingController(firstPageKey: 0);
//   static const _pageSize = 17;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250,
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: widget.movies.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return MovieItem(
//             movie: widget.movies[index],
//           );
//         },
//       ),
//     );
//   }