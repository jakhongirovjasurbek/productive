import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/stats_name.dart';
import 'package:productive/features/statistics/presentation/pages/statistics.dart';

class StatsRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StatsRouteNames.stats:
        return fade(const StatisticsScreen());
    }
    return null;
  }
}
