import 'package:flutter/material.dart';
import 'package:movies_interview_task/common/resources/colors.dart';

import '../../../common/resources/text_styles.dart';

class ReusableMovieVote extends StatelessWidget {
  const ReusableMovieVote({required this.vote, super.key});

  final double vote;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: AppColors.yellow,
        ),
        const SizedBox(width: 4.0),
        Text(
          "$vote/10 IMDb",
          style: AppTextStyles.filson12BlackTextW400,
        ),
      ],
    );
  }
}
