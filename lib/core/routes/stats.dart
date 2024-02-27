import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/expanse_name.dart';
import 'package:productive/core/route_names/stats_name.dart';

class StatsRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StatsRouteNames.stats:
        return fade(const Scaffold());
      
       
    }
  }
}