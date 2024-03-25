import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/domain/entities/task_entity.dart';
import '../../../../assets/colors.dart';
import '../bloc/task_bloc.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.upcomingLinkBolt,
          border: Border(
            right: BorderSide(
              width: 10,
              style: BorderStyle.solid,
              color: getPriorityColor(task.priority),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: getIconColor(task.iconColor),
                  ),
                  child: SvgPicture.network(task.icon),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: context.colors.whiteLabel,
                          decoration: task.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    const Gap(2),
                    Text(
                      '${getProperTime(task.startDate)} - ${getProperTime(task.dueDate)}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context.colors.allPageTextColor,
                          decoration: task.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<TaskBloc>()
                          .add(CheckedTask(index: task.id));
                    },
                    child: task.isChecked
                        ? SvgPicture.asset(context.icons.checked)
                        : SvgPicture.asset(context.icons.unchecked),
                  ),
                ),
              ],
            ),
            if (task.note != "" && task.note != null) ...{
              const Gap(8),
              Text(
                task.note!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: context.colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  decoration: task.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}

getIconColor(String iconColor) {
  switch (iconColor) {
    case 'pinkColor':
      return AppColors.englishStudy;
    case 'orangeColor':
      return AppColors.gymColor;
    case 'greenColor':
      return AppColors.greenIconColor;
    case 'blueColor':
      return AppColors.cleaningRoom;
    default:
      return AppColors.selectIconWork;
  }
}

Color getPriorityColor(String priority) {
  switch (priority) {
    case 'high':
      return AppColors.redPriority;
    case 'medium':
      return AppColors.yellowPriority;
    case 'low':
      return AppColors.greenPriority;
    default:
      return Colors.transparent;
  }
}

String getProperTime(Timestamp value) {
  final date = value.toDate();
  final hour = date.hour >= 12 ? date.hour - 12 : date.hour;
  final formattedHour = hour < 10 ? '0$hour' : '$hour';
  final minute = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
  final period = date.hour >= 12 ? 'PM' : 'AM';

  return "$formattedHour:$minute $period";
}
