import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/calendar.dart';
import 'package:productive/core/pages/create.dart';
import 'package:productive/core/pages/expense.dart';
import 'package:productive/core/pages/home.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/core/pages/stats.dart';
import 'package:productive/core/pages/tasks.dart';






class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashPage());
        case AppRouteNames.home:
        return fade(const HomePage());
          case AppRouteNames.tasks:
        return fade(const TasksPage());
          case AppRouteNames.expense:
        return fade(const ExpensePage());
          case AppRouteNames.create:
        return fade(const CreatePage());
          case AppRouteNames.calendar:
        return fade(const CalendarPage());
          case AppRouteNames.stats:
        return fade(const StatsPage());
    }
  }
}