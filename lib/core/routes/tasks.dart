import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/tasks/presentation/pages/notes.dart';
import 'package:productive/features/tasks/presentation/pages/notifications.dart';
import 'package:productive/features/tasks/presentation/task_screen.dart';

class TaskRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskRouteNames.tasks:
        return fade(const TaskScreen());
      case TaskRouteNames.createTasks:
        return fade(const Scaffold());
      case TaskRouteNames.notes:
        return fade(const NotesPage());
      case TaskRouteNames.notifications:
        return fade(const NotificationPage());
    }
    return null;
  }
}




