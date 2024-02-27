import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/core/route_names/app_route_name.dart';
import 'package:productive/features/home/home.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashPage());
      case AppRouteNames.home:
        return fade(const HomePage());
      default:
        return fade(const Scaffold());
    }
  }
}
