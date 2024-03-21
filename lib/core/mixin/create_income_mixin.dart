import 'package:flutter/material.dart';
import 'package:productive/features/create/data/model/income_status.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/pages/create_income.dart';

import '../../../../assets/icons.dart';

mixin CreateIncomeMixin on State<CreateIncomeScreen> {
  TextEditingController titleController = TextEditingController();
  int usd = 0;
  TextEditingController noteController = TextEditingController();

  String getSvg(IncomePriority priority) {
    switch (priority) {
      case IncomePriority.salary:
        return AppIcons.moneyFirst;
      case IncomePriority.expense:
        return AppIcons.moneySecond;
    }
  }

  Color getColor(IncomePriority priority) {
    switch (priority) {
      case IncomePriority.expense:
        return context.colors.addButtonLinear1;
      case IncomePriority.salary:
        return context.colors.meetingColor;
    }
  }
}