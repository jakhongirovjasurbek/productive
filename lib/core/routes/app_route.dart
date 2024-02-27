import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/features/tasks/presentation/pages/notifications.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (
    settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashPage());
      case AppRouteNames.notification:
        return fade(const NotificationPage());
      default:
        return fade(const Scaffold());
    }
  }
}
