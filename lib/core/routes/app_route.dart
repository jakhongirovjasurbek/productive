import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/splash.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashPage());
    }
  }
}
