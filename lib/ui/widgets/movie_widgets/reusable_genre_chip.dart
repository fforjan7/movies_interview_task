import 'package:flutter/material.dart';
import 'package:movies_interview_task/common/resources/colors.dart';

import '../../../common/resources/text_styles.dart';

class ReusableGenreChip extends StatelessWidget {
  const ReusableGenreChip({required this.genre, super.key});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppColors.chipBackground,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          genre,
          style: AppTextStyles.filson11BlackTitleW425,
        ),
      ),
    );
  }
}
