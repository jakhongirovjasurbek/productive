import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/features/create/pages/create_event.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashPage());
      case AppRouteNames.create_event:
        return fade(const CreateEvent());
      default:
        return fade(const Scaffold());
    }
  }
}
