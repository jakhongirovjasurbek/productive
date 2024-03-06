import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/expanse_name.dart';
import 'package:productive/features/expense/presentation/pages/expense_screen.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/tab_bar/main_tabbar.dart';

class ExpenseRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ExpenseRouteNames.expense:
        return fade(const ExpenseScreen());
      default:
        return fade(const Scaffold());
    }
    return null;
  }
}