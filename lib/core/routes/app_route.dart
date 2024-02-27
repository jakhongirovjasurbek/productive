import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/features/authentication/presentation/pages/create_new_password/presentation/pages/main_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const CreateNewPassword());
      case AppRouteNames.home:
        return fade(const Scaffold());
      default:
        return fade(const Scaffold());
    }
  }
}
