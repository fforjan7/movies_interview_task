import 'package:flutter/material.dart';
import 'package:movies_interview_task/common/resources/text_styles.dart';
import 'package:movies_interview_task/ui/widgets/movie_widgets/reusable_genre_chip.dart';
import 'package:movies_interview_task/ui/widgets/movie_widgets/reusable_movie_vote.dart';

import '../../../../data/models/domain/movie.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.grey[200],
      ),
      child: ListView(
        padding: const EdgeInsets.only(left: 24.0, top: 24, right: 24),
        children: [
          Text(movie.title, style: AppTextStyles.filson22BlackTitleW700),
          const SizedBox(height: 12),
          ReusableMovieVote(vote: movie.vote),
          const SizedBox(height: 12),
          Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            children: List<Widget>.generate(movie.genres.length,
                (index) => ReusableGenreChip(genre: movie.genres[index].name)),
          ),
          const SizedBox(height: 48),
          const Text("Descritpion",
              style: AppTextStyles.playfair16BlackTextW700),
          const SizedBox(height: 8),
          Text(movie.overview, style: AppTextStyles.filson15BlackTextW400),
        ],
      ),
    );
  }
}
