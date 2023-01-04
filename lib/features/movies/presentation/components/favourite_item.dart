// import '../../domain/entites/now_playing_response.dart';
// import '../screens/movie_details.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class FavouriteItem extends StatelessWidget {
//   const FavouriteItem({Key? key, required this.movie, required this.onDelete})
//       : super(key: key);
//   final VoidCallback onDelete;
//   final Movie movie;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return MovieDetailsScreen(movie: movie);
//             },
//           ));
//         },
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//           child: Stack(
//             fit: StackFit.passthrough,
//             children: [
//               CachedNetworkImage(
//                 width: 170.0,
//                 fit: BoxFit.cover,
//                 imageUrl: movie.backdropPath!,
//                 placeholder: (context, url) => Shimmer.fromColors(
//                   baseColor: Colors.grey.shade700,
//                   highlightColor: Colors.grey.shade800,
//                   child: Container(
//                     height: 200.0,
//                     width: 170.0,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//               Positioned(
//                   top: 5,
//                   right: 5,
//                   child:
//                       IconButton(onPressed: onDelete, icon: Icon(Icons.delete)))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
