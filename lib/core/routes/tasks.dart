import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/create/presentation/pages/create_screen.dart';
import 'package:productive/features/create/presentation/pages/map_screen.dart';
import 'package:productive/features/notes/presentation/notes.dart';

import '../../features/tasks1/presentation/tasks_screen.dart';

class TaskRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskRouteNames.tasks:
        return fade(const TaskScreen());
      case TaskRouteNames.createtasks:
        return fade(const Scaffold());
      case TaskRouteNames.mapScreen:
        return fade(const MapScreen());
      case TaskRouteNames.notes:
        return fade(const NotesPage());
    }
    return null;
  }
}
