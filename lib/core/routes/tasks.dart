import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/tasks/presentation/pages/quick_notes.dart';

class TaskRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskRouteNames.tasks:
        return fade(const QuickNotes());
       case TaskRouteNames.createtasks:
        return fade(const Scaffold());
       
    }
    return null;
  }
}