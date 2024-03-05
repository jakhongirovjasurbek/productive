import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/fonts.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData();

  ThemeData darkTheme() {
    final colors = AppColors();
    return ThemeData(
      scaffoldBackgroundColor: colors.mainDark,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.mainDark,
      ),
      extensions: [
        AppFonts(
          fontSize20Weight300: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: colors.white,
          ),
          fontSize40Weight700: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize16Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize16Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
          fontSize16Weight500Blue: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.skipButtonColor,
          ),
          fontSize16Weight500Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.unactivatedColor,
          ),
          fontSize16Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.whiteLabel,
          ),
          fontSize16Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize14Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize24Weight600: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: colors.whiteLabel.withOpacity(0.8),
          ),
          fontSize24Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize20Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize20Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
          fontSize20Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize18Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize18Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colors.whiteLabel,
          ),
          fontSize18Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
          fontSize18Weight500red: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.notificationsClear),
          fontSize18Weight500green: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.expensesGreen,
          ),
          fontSize18Weight500Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.unactivatedColor,
          ),
          fontSize18Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize15Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize14Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize16Weight500orange: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.expensesFood,
          ),
          fontSize16Weight500blue: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.expensesShopping,
          ),
          fontSize16Weight500purple: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.expensesGift,
          ),
          fontSize16Weight400blue: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.addButtonLinear1,
          ),
          fontSize14Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colors.whiteLabel,
          ),
          fontSize14Weight400grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.tasksTimeColor,
          ),
          fontSize14Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
          fontSize14Weight500whitish: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.tasksTimeColor,
          ),
          fontSize12Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.whiteLabel,
          ),
          fontSize12Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize10Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize8Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: colors.whiteLabel,
          ),
          fontSize30Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: colors.whiteLabel,
          ),
          fontSize14Weight400Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.unactivatedColor,
          ),
          fontSize14Weight500Grey: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.createTaskTime,
          ),
        ),
      ],
    );
  }
}
