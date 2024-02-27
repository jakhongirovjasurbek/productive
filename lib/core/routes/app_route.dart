import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/features/create_new_password/prezentation/pages/main_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const CreateNewPassword());
    }
  }
}
