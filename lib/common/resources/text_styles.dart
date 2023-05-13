import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

abstract class AppTextStyles {
  //_FILSON________________________________________________________________________

  static const TextStyle filson11BlackTitleW425 = TextStyle(
    fontFamily: AppFonts.filson,
    fontSize: 11,
    color: AppColors.blackTitle,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle filson12BlackTextW400 = TextStyle(
    fontFamily: AppFonts.filson,
    fontSize: 12,
    color: AppColors.blackText,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle filson15BlackTitleW400 = TextStyle(
    fontFamily: AppFonts.filson,
    fontSize: 15,
    color: AppColors.blackTitle,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle filson15BlackTitleW500 = TextStyle(
    fontFamily: AppFonts.filson,
    fontSize: 15,
    color: AppColors.blackTitle,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle filson22BlackTitleW700 = TextStyle(
    fontFamily: AppFonts.filson,
    fontSize: 22,
    color: AppColors.blackTitle,
    fontWeight: FontWeight.w700,
  );

  //_PLAYFAIR________________________________________________________________________

  static const TextStyle playfair24BlackTextW700 = TextStyle(
    fontFamily: AppFonts.playfair,
    fontSize: 24,
    color: AppColors.blackText,
    fontWeight: FontWeight.w700,
  );
}
