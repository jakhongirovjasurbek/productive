import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/tasks/create/presentation/create_screen.dart';
import 'package:productive/features/tasks/create/presentation/pages/map_screen.dart';

class TaskRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskRouteNames.tasks:
        return fade(const Scaffold());
      case TaskRouteNames.createtasks:
        return fade(const CreateScreen());

      case TaskRouteNames.mapScreen:
        return fade(const MapScreen());
    }
    return null;
  }
}
