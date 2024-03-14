import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';

class IconTabBar extends StatelessWidget {
  const IconTabBar({super.key});

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
            context.read<ExpenseBloc>().add(SelectIcon(icon: items[index]),);
            print(items[index]);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: context.colors.colorContainerEleventh,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Center(child: SvgPicture.asset(items[index])),
            ],
          ),
        );
      },
    );
  }
}

List items = [
  AppIcons.car_repair,
  AppIcons.art,
  AppIcons.tabaka,
  AppIcons.game_controller,
  AppIcons.headphones,
  AppIcons.ball,
  AppIcons.phone,
  AppIcons.cat,
  AppIcons.burger,
  AppIcons.crayon,
  AppIcons.cart,
  AppIcons.plane,
  AppIcons.glasses,
  AppIcons.dumbbell,
  AppIcons.baby,
  AppIcons.basket,
  AppIcons.cap,
  AppIcons.umbrella,
  AppIcons.t_shirt,
  AppIcons.dog,
  AppIcons.translate,
  AppIcons.gift_box,
  AppIcons.cardSolo
];
