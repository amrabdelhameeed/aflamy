import 'package:aflamy/features/movies/domain/entites/movies_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
            ),
            child: Text(movie.voteAverage!.toStringAsFixed(1),
                style: TextStyle(color: Colors.white, fontSize: 27.sp)),
          ),
          Text("${movie.voteCount!} Reviews",
              style: TextStyle(color: Colors.white, fontSize: 20.sp)),
          Text(
            movie.overview!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
