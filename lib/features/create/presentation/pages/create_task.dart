import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/widgets/w_button.dart';
import 'package:productive/features/create/presentation/widgets/task_widgets/add_location.dart';
import 'package:productive/features/create/presentation/widgets/task_widgets/row_buttun.dart';
import 'package:productive/features/create/presentation/widgets/task_widgets/select_icon_bottom_sheet.dart';
import 'package:productive/features/create/presentation/widgets/task_widgets/time_column.dart';
import 'package:productive/features/create/presentation/widgets/w_text_field.dart';
import '../../../../assets/icons.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../../tasks/presentation/widgets/task_item.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    int? priorityIndex = 4;
    String title = '';
    String desc = '';
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppIcons.backPage),
                ),
                const Spacer(),
                Text(
                  context.localization.create_task,
                  style: context.style.fontSize24Weight700,
                ),
                const Spacer(),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16),
            child: WButton(
              borderRadius: 8,
              height: 40,
              onTap: () {
                if (title.isNotEmpty && priorityIndex! < 3) {
                  if (state.startDate.microsecondsSinceEpoch <
                      state.endDate.microsecondsSinceEpoch) {
                    context.read<TaskBloc>().add(
                          CreateNewTaskButtonPressed(
                            title: title,
                            icon: state.selectIcon,
                            priority:
                                getTextPriority(priorityIndex!).toLowerCase(),
                            startDate: state.startDate,
                            note: desc,
                            dueDate: state.endDate,
                            isChecked: false,
                            iconColor: state.iconColor,
                            position: state.position,
                            onSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Task successfully created'),
                                ),
                              );
                            },
                            onFailure: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Unknown error occurred'),
                                ),
                              );
                            },
                          ),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('End Date must be higher!'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Title and priority must be initialized!'),
                    ),
                  );
                }
              },
              child: Text(
                context.localization.save,
                style: context.style.fontSize16Weight500,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 18, top: 14),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: getIconColor(state.iconColor),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                selectIconTask(context);
                              },
                              child: SvgPicture.network(state.selectIcon),
                            ),
                          ),
                          Expanded(
                            child: WTextField(
                              onChange: (titleT) {
                                title = titleT;
                              },
                              style: context.style.fontSize18Weight600,
                            ),
                          ),
                        ],
                      ),
                      const Gap(24),
                      Row(
                        children: [
                          TimeColumn(
                              isStartDate: true,
                              title: context.localization.start,
                              time: state.startDate),
                          const Spacer(),
                          TimeColumn(
                            title: context.localization.end,
                            time: state.endDate,
                            isStartDate: false,
                          ),
                        ],
                      ),
                      const Gap(34),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(context.localization.priority,
                            style: context.style.fontSize16Weight500Blue),
                      ),
                      const Gap(12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  priorityIndex = index;
                                  context.read<TaskBloc>().add(
                                        SelectPriorityColor(index: index),
                                      );
                                },
                                child: Container(
                                  width: 78,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: getPriorityColor(
                                                getTextPriority(index)
                                                    .toLowerCase()) ==
                                            state.priorityColor
                                        ? state.priorityColor
                                        : null,
                                    border: Border.all(
                                      color: getPriorityColor(
                                          getTextPriority(index).toLowerCase()),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    getTextPriority(index),
                                    style: context.style.fontSize12Weight500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Gap(20),
                      Container(
                        height: 0.5,
                        width: double.maxFinite,
                        color: context.colors.white.withOpacity(0.2),
                      ),
                      const Gap(20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.inpBackgroundColor,
                        ),
                        padding: const EdgeInsets.only(
                            left: 12, right: 18, bottom: 12),
                        child: WTextField(
                          onChange: (descT) {
                            desc = descT;
                          },
                          maxLines: 5,
                          decoration: InputDecoration(
                              fillColor: context.colors.inpBackgroundColor,
                              hintText: context.localization.add_note,
                              hintStyle:
                                  context.style.fontSize14Weight500whitish,
                              border: InputBorder.none),
                          style: context.style.fontSize14Weight400,
                        ),
                      ),
                      const Gap(19),
                      RowBottom(
                        icon: AppIcons.location,
                        onTap: () {
                          addLocation(context);
                        },
                        title: context.localization.add_location,
                      ),
                      const Gap(16),
                      RowBottom(
                        icon: AppIcons.notification,
                        onTap: () {},
                        title: context.localization.add_notification,
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }

  String getTextPriority(int index) {
    switch (index) {
      case 0:
        return "High";
      case 1:
        return "Medium";
      case 2:
        return "Low";
      default:
        return "";
    }
  }
}
