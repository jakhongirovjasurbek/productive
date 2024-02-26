import 'package:flutter/material.dart';

class AppFonts extends ThemeExtension<AppFonts> {
  final TextStyle fontSize40Weight700;
  final TextStyle fontSize16Weight400;
  final TextStyle fontSize16Weight500;
  final TextStyle fontSize16Weight600;
  final TextStyle fontSize16Weight700;
  final TextStyle fontSize14Weight400;

  AppFonts({
    required this.fontSize40Weight700,
    required this.fontSize16Weight400,
    required this.fontSize16Weight500,
    required this.fontSize16Weight600,
    required this.fontSize16Weight700,
    required this.fontSize14Weight400,
  });

  @override
  ThemeExtension<AppFonts> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppFonts> lerp(
      covariant ThemeExtension<AppFonts>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
