import 'package:flutter/material.dart';
import 'package:movies_interview_task/common/resources/text_styles.dart';
import 'package:movies_interview_task/ui/widgets/reusable_genre_chip.dart';
import 'package:movies_interview_task/ui/widgets/reusable_movie_vote.dart';
import 'package:movies_interview_task/ui/widgets/reusable_poster_image.dart';

import '../../data/models/domain/movie.dart';

class ReusableMovieTile extends StatelessWidget {
  const ReusableMovieTile(
      {required this.movie, required this.onTap, super.key});

  final Movie movie;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusablePosterImage(
            movie: movie,
            onTap: onTap,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    movie.title,
                    style: AppTextStyles.filson15BlackTitleW500,
                  ),
                  ReusableMovieVote(vote: movie.vote),
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: List<Widget>.generate(
                        movie.genres.length,
                        (index) =>
                            ReusableGenreChip(genre: movie.genres[index].name)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
