import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';

import '../../../../assets/icons.dart';
import '../pages/new_catalog.dart';

Future<dynamic> selectIcon(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: context.colors.loginTextFieldBackgroundColor,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            height: 24,
                            width: 24,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child:
                                SvgPicture.asset(AppIcons.selectIconBack)),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      onChanged: (value) {
                        context.read<ExpenseBloc>().add(Searching(query: value));
                      },
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        fillColor: context.colors.whiteLabel,
                        hintText: context.localization.search_by_category,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(AppIcons.createsearch),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ...List.generate(5, (index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ExpenseBloc>().add(SelectIcon(icon: getIcon(index),indexColor: index + 16));
                      },
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: getColor(index),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            getIcon(index),
                          ),
                        ),
                        title: Text(
                          getTitle(index),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500,color: context.colors.whiteLabel,)
                        ),
                      ),
                    ),

                    const Divider(),
                  ],
                );
              }),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewCategory(),));
                },
                child: ListTile(
                  leading: SvgPicture.asset(AppIcons.new_category),
                  title: Text('New Category',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w500, color: context.colors.whiteLabel),
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        );
      });
}

String getIcon(int index) {
  switch (index) {
    case 0:
      return AppIcons.food2;
    case 1:
      return AppIcons.health;
    case 2:
      return AppIcons.shopping2;
    case 3:
      return AppIcons.gift2;
    default:
      return AppIcons.transport;
  }
}

String getTitle(int index) {
  switch (index) {
    case 0:
      return "Food";
    case 1:
      return "Health";
    case 2:
      return "Shopping";
    case 3:
      return 'Gift';
    default:
      return 'Transport';
  }
}

Color getColor(int index) {
  switch (index) {
    case 0:
      return Colors.orange;
    case 1:
      return Colors.pink;
    case 2:
      return Colors.blue;
    case 3:
      return Colors.purple;
    default:
      return Colors.greenAccent;
  }
}

