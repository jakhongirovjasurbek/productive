
import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/fonts.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData();

  ThemeData darkTheme() {
    final colors = AppColors();
    return ThemeData(
      scaffoldBackgroundColor: colors.mainDark,
      extensions: [
        AppFonts(
          fontSize40Weight700: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize16Weight400: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize16Weight500: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
          fontSize16Weight600: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.whiteLabel,
          ),
          fontSize16Weight700: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize14Weight400: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize24Weight700: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: colors.whiteLabel),
          fontSize14Weight500: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: colors.clearButton),
          fontSize12Weight500: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,overflow: TextOverflow.fade
          ), fontSize8Weight400: TextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: colors.greyDate),
          fontSize20Weight500:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
        ),
      ],
    );
  }
}
