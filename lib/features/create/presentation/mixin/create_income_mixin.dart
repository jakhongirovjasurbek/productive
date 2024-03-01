import 'package:flutter/material.dart';
import 'package:productive/core/create_status/income_status.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/pages/create_income.dart';

mixin  CreateIncomeMixin on State<CreateIncomeScreen>{
  TextEditingController? titleController;
  int usd = 0;
  TextEditingController? noteController;
  String getSvg(IncomePrio prio) {
    switch (prio) {
      case IncomePrio.salary:
        return context.icons.moneyFirst;
      case IncomePrio.expense:
        return context.icons.moneySecond;
    }
  }

  Color getColor(IncomePrio prio) {
    switch (prio) {
      case IncomePrio.expense:
        return context.colors.addButtonLinear1;
      case IncomePrio.salary:
        return context.colors.meetingColor;
    }
  }
}