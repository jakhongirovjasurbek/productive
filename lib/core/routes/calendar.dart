import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/calendar_route_name.dart';

class CalendarRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CalendarRouteNames.calendar:
        return fade(const Scaffold());
 
    }
    return null;
  }
}