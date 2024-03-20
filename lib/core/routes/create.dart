import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/create_name.dart';

class CreateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CreateRouteNames.create_event:
        return fade(const Scaffold());
      case CreateRouteNames.create_income:
        return fade(const Scaffold());
       
    }
    return null;
  }
}