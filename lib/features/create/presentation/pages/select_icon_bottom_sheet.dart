import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:productive/core/extensions/extensions.dart';

import '../bloc/task_bloc.dart';

Future<dynamic> selectIcon(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: context.colors.bottomSheetBgColor,
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
                                child: SvgPicture.asset(context.icons.x)),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      style: context.style.fontSize14Weight600
                          .copyWith(color: context.colors.white),
                      cursorColor: context.colors.buttonDisabledColor,
                      decoration: InputDecoration(
                        fillColor: context.colors.tasksTimeColor,
                        hintText: context.localization.search_by_category,
                        hintStyle:
                            context.style.fontSize14Weight400grey.copyWith(
                          color: context.colors.tasksTimeColor,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            context.icons.search,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 1.5,
                color: const Color.fromRGBO(98, 114, 130, 0.3),
              ),
              ...List.generate(3, (index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<TaskBloc>().add(
                              SelectIconButtonPressed(
                                  index: index, context: context),
                            );

                        Navigator.of(context).pop();
                      },
                      child: ListTile(
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: getColor(index, context),
                              ),
                            ),
                            SvgPicture.asset(
                              getIcon(index, context),
                            ),
                          ],
                        ),
                        title: Text(
                          getTitle(index, context),
                          style: context.style.fontSize20Weight500.copyWith(
                            color: context.colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.5,
                      color: const Color.fromRGBO(98, 114, 130, 0.3),
                    ),
                  ],
                );
              })
            ],
          ),
        );
      });
}

String getIcon(int index, BuildContext context) {
  switch (index) {
    case 0:
      return context.icons.bag;
    case 1:
      return context.icons.study;
    default:
      return context.icons.sport;
  }
}

String getTitle(int index, BuildContext context) {
  switch (index) {
    case 0:
      return context.localization.work;
    case 1:
      return context.localization.study;
    default:
      return context.localization.sport;
  }
}

Color getColor(int index, BuildContext context) {
  switch (index) {
    case 0:
      return context.colors.workColor;
    case 1:
      return context.colors.studyColor;
    default:
      return context.colors.expensesFood;
  }
}
