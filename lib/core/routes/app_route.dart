import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/onboarding.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/features/authentication/presentation/pages/create_new_password.dart';
import 'package:productive/core/route_names/app_route_name.dart';
import 'package:productive/features/home/home.dart';
import 'package:productive/features/calendar/calendar_screen.dart';
import 'package:productive/features/statistics/presentation/pages/statistics.dart';

import '../../features/create/presentation/pages/create_expense.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashPage());
      case AppRouteNames.home:
        return fade(const HomePage());
      case AppRouteNames.onboarding:
        return fade(const OnboardingPage());
      case AppRouteNames.createNewPassword:
        return fade(const CreateNewPassword());
      case AppRouteNames.calendar:
        return fade(const CalendarScreen());
      case AppRouteNames.statistics:
        return fade(const StatisticsScreen());
      default:
        return fade(const Scaffold());
    }
  }
}
