import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/expanse_name.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/tab_bar/single_category.dart';

class ExpenseRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ExpenseRouteNames.expense:
        return fade( SingleCategory());
      case ExpenseRouteNames.createexpense:
        return fade(const Scaffold());
       
    }
    return null;
  }
}