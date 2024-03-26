import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';
import 'package:productive/features/create/presentation/widgets/select_icon_expense.dart';
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
                      autofocus: false,
                      style: context.style.fontSize14Weight400.copyWith(color: context.colors.whiteLabel),
                      decoration: InputDecoration(
                        fillColor: context.colors.create_search_color,
                        filled: true,
                        hintText: context.localization.search_by_category,
                        hintStyle: context.style.fontSize14Weight400,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(AppIcons.createsearch),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colors.create_search_color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(24)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colors.create_search_color),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(16),
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
                          child: SvgPicture.network(
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
                  title: Text(context.localization.new_category,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w500, color: context.colors.whiteLabel),
                  ),
                ),
              ),
              Gap(10),
            ],
          ),
        );
      });
}

String getIcon(int index) {
  switch (index) {
    case 0:
      return items[0];
    case 1:
      return items[1];
    case 2:
      return items[2];
    case 3:
      return items[3];
    default:
      return items[4];
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

