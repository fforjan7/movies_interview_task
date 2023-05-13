import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/domain/movie.dart';

class ReusableBackdropImage extends StatelessWidget {
  const ReusableBackdropImage({required this.movie, this.width, super.key});

  final Movie movie;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      imageUrl: movie.backdropPath.isNotEmpty
          ? Movie.getFullImagePath(movie.backdropPath)
          : Movie.getFullImagePath(movie.posterPath),
      placeholder: (context, url) {
        return const Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
