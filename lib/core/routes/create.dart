import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/create_name.dart';

import '../../features/create/presentation/pages/create.dart';
import '../../features/create/presentation/pages/create_event.dart';
import '../../features/create/presentation/pages/create_expense.dart';
import '../../features/create/presentation/pages/create_income.dart';

class CreateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CreateRouteNames.create_event:
        return fade(const CreateEvent());
      case CreateRouteNames.create_income:
        return fade(const CreateIncomeScreen());
      case CreateRouteNames.create:
        return fade(const CreateItems());
      case CreateRouteNames.create_expence:
        return fade(const CreateExpanse());
      case CreateRouteNames.create_notes:
        return fade(const Scaffold());
    }
    return null;
  }
}