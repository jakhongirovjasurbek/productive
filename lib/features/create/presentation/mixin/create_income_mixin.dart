// import 'package:flutter/material.dart';
// import 'package:productive/core/create_status/income_status.dart';
// import 'package:productive/core/extensions/extensions.dart';
// import 'package:productive/features/create/presentation/pages/create_income.dart';
//
// import '../../../../assets/icons.dart';
//
// mixin  CreateIncomeMixin on State<CreateIncomeScreen>{
//   TextEditingController? titleController;
//   int usd = 0;
//   TextEditingController? noteController;
//   String getSvg(IncomePrio prio) {
//     switch (prio) {
//       case IncomePrio.salary:
//         return AppIcons.moneyFirst;
//       case IncomePrio.expense:
//         return AppIcons.moneySecond;
//     }
//   }
//
//   Color getColor(IncomePrio prio) {
//     switch (prio) {
//       case IncomePrio.expense:
//         return context.colors.addButtonLinear1;
//       case IncomePrio.salary:
//         return context.colors.meetingColor;
//     }
//   }
// }