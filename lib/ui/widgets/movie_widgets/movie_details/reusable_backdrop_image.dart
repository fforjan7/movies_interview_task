import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/domain/movie.dart';

class ReusableBackdropImage extends StatelessWidget {
  const ReusableBackdropImage({
    required this.movie,
    this.isHidden = false,
    super.key,
  });

  final Movie movie;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: isHidden ? 0 : double.infinity,
      imageUrl: movie.backdropPath.isNotEmpty
          ? Movie.getFullImagePath(movie.backdropPath)
          : Movie.getFullImagePath(movie.posterPath),
      placeholder: (context, url) => Container(
          width: double.infinity,
          height: isHidden ? 0 : 200,
          color: Colors.grey,
          child: const Center(child: CircularProgressIndicator())),
      errorWidget: (context, url, error) => Container(
        width: double.infinity,
        height: isHidden ? 0 : 200,
        color: Colors.grey,
        child: const Icon(Icons.error),
      ),
    );
  }
}
