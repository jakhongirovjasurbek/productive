import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/expanse_name.dart';
import '../../features/expense/presentation/widgets/tab_bar/main_tabbar.dart';

class ExpenseRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ExpenseRouteNames.expense:
        return fade(SingleCategory());
      case ExpenseRouteNames.create_expense:
        return fade(const Scaffold());
       
    }
    return null;
  }
}