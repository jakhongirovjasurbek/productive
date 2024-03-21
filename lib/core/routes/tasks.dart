import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/tasks/presentation/pages/notes.dart';
import '../../features/tasks/presentation/task_screen.dart';

class TaskRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskRouteNames.tasks:
        return fade(const TaskScreen());
      case TaskRouteNames.createtasks:
        return fade(const Scaffold());
      case TaskRouteNames.notes:
        return fade(const NotesPage());
    }
    return null;
  }
}




