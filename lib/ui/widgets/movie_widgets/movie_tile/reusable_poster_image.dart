import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_interview_task/common/resources/icons.dart';
import 'package:movies_interview_task/data/models/domain/movie.dart';

class ReusablePosterImage extends StatelessWidget {
  const ReusablePosterImage(
      {required this.movie, required this.onTap, super.key});

  final Movie movie;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            width: 85,
            imageUrl: Movie.getFullImagePath(movie.posterPath),
            placeholder: (context, url) {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  movie.isFavorite ? AppIcons.favorite : AppIcons.addToFavorite,
                  key: ValueKey(movie.isFavorite),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
