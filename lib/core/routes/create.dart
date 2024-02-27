import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/create_name.dart';

class CreateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CreateRouteNames.create:
        return fade(const Scaffold());
      case CreateRouteNames.homecreate:
        return fade(const Scaffold());
       
    }
  }
}