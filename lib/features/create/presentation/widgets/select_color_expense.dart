import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/icons.dart';
import '../bloc/create_expense/create_expense_bloc.dart';

class ColorTabBar extends StatelessWidget {
  const ColorTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 40,
        mainAxisSpacing: 34.0,
        crossAxisSpacing: 30.0,
      ),
      padding: const EdgeInsets.all(50.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              context.read<ExpenseBloc>().add(SelectIcon(indexColor: index));
              colors[index];
              print(colors[index]);
            },
            child: Center(child: SvgPicture.asset(items[index])));
      },
    );
  }
}

List items = [
  AppIcons.color1,
  AppIcons.color2,
  AppIcons.color3,
  AppIcons.color4,
  AppIcons.color5,
  AppIcons.color6,
  AppIcons.color7,
  AppIcons.color8,
  AppIcons.color9,
  AppIcons.color10,
  AppIcons.color11,
  AppIcons.color12,
  AppIcons.color13,
  AppIcons.color14,
  AppIcons.color15,
  AppIcons.color16,
];
List colors = [
  Color(0xFFF2BC1A),
  Color(0xFF1D6F70),
  Color(0xFFFF8B7B),
  Color(0xFF9571F6),
  Color(0xFF6FBAFD),
  Color(0xFFA0D430),
  Color(0xFF4DAA52),
  Color(0xFFB25B52),
  Color(0xFFAE2828),
  Color(0xFF979797),
  Color(0xFFFF01B8),
  Color(0xFF266193),
  Color(0xFF005AC5),
  Color(0xFF979797),
  Color(0xFF979797),
  Color(0xFF979797),
  Color(0xFFFF8700),
  Color(0xFFFF2752),
  Color(0xFF32A7E2),
  Color(0xFFB548C6),
  Color(0xFF22B07D),
  Color(0xFF4B7FD6)
];
