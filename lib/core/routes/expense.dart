import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/expanse_name.dart';
import 'package:productive/features/create/presentation/pages/create_expense.dart';
import 'package:productive/features/expense/presentation/pages/expense_screen.dart';
import 'package:productive/features/expense/presentation/widgets/tab_bar/main_tabbar.dart';

class ExpenseRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ExpenseRouteNames.expense:
        return fade( const ExpenseScreen());
      case ExpenseRouteNames.singleCategory:
        return fade( const SingleCategory());
      case ExpenseRouteNames.createexpense:
        return fade(const CreateExpanse());
    }
    return null;
  }
}