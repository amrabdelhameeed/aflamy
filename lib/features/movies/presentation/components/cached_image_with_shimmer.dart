import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageWithShimmer extends StatelessWidget {
  final String imageUrl;
  final bool isSliverAppBarBackground;
  const CachedImageWithShimmer(
      {Key? key, required this.imageUrl, this.isSliverAppBarBackground = false})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: isSliverAppBarBackground
            ? const BorderRadius.vertical(bottom: Radius.circular(20))
            : BorderRadius.circular(15),
        child: CachedNetworkImage(
          width: 170.0,
          height: 280.0,
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade800,
            child: Container(
              height: 280.0,
              width: 170.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: isSliverAppBarBackground
                    ? const BorderRadius.vertical(bottom: Radius.circular(20))
                    : BorderRadius.circular(15),
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ));
  }
}
