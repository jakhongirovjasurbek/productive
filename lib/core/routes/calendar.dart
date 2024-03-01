import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/calendar_route_name.dart';
import 'package:productive/features/calendar/calendar_screen.dart';

class CalendarRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CalendarRouteNames.calendar:
        return fade(const CalendarScreen());
    }
    return null;
  }
}
