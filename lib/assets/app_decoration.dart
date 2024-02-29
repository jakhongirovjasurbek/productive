import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';

class AppDecoration {
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: AppColors.blueGray900,
      );

  static BoxDecoration get fillRed => BoxDecoration(
        color: AppColors.timeContainerOne.withOpacity(0.3),
      );

  static BoxDecoration get gradientBlueGrayToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.2, 0.3),
          end: const Alignment(0.99, 1),
          colors: [
            AppColors.blueGray900,
            AppColors.blueGray90099,
            AppColors.blueGray90099.withOpacity(0.12),
          ],
        ),
      );

  static BoxDecoration get outlineBlueGrayC => const BoxDecoration();
  static BoxDecoration get outlineGray => const BoxDecoration();
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder12 => BorderRadius.circular(
        12,
      );

  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8,
      );
}
