import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/fonts.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData();

  ThemeData darkTheme() {
    final colors = AppColors();
    return ThemeData(
      scaffoldBackgroundColor: AppColors.mainDark,
      extensions: [
        AppFonts(
          fontSize40Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteLabel,
          ),
          fontSize16Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize16Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteLabel,
          ),
          fontSize16Weight500Blue: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.skipButtonColor,
          ),
          fontSize16Weight500Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.unactivatedColor,
          ),
          fontSize16Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteLabel,
          ),
          fontSize16Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteLabel,
          ),
          fontSize14Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize24Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteLabel,
          ),
          fontSize24Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteLabel,
          ),
          fontSize20Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteLabel,
          ),
          fontSize20Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteLabel,
          ),
          fontSize20Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize18Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteLabel,
          ),
          fontSize18Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteLabel,
          ),
          fontSize18Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteLabel,
          ),
          fontSize18Weight500Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.unactivatedColor,
          ),
          fontSize18Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize15Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize14Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteLabel,
          ),
          fontSize14Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteLabel,
          ),
          fontSize14Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteLabel,
          ),
          fontSize12Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteLabel,
          ),
          fontSize12Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize10Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize8Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteLabel,
          ),
          fontSize14Weight400Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.unactivatedColor,
          ),
          fontSize14Weight500Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.createTaskTime,
          ),
        ),
      ],
    );
  }
}
