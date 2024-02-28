import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/expanse_name.dart';

class ExpenseRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ExpenseRouteNames.expense:
        return fade(const Scaffold());
      case ExpenseRouteNames.createexpense:
        return fade(const Scaffold());
       
    }
  }
}