import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:productive/features/tasks/data/models/task_models.dart';
import 'package:productive/features/tasks/presentation/pages/drawer.dart';
import 'package:productive/features/tasks/data/models/status.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        drawer: const DrawerMenu(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 116,
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset(context.icons.humburger),
                        );
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, TaskRouteNames.notes),
                      child: SvgPicture.asset(context.icons.note),
                    ),
                    const SizedBox(width: 24),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, TaskRouteNames.notifications),
                      child: SvgPicture.asset(context.icons.notyfication),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                TextField(

                  style: TextStyle(color: context.colors.whiteLabel,

                  ),

                  onChanged: (value) {
                    context.read<TaskBloc>().add(
                      Searching(query: value),
                    );
                  },
                  cursorColor: context.colors.buttonDisabledColor,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: context.colors.textFieldBackgroundColor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 13.5),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        context.icons.search,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(context.icons.filter)),
                    ),
                    filled: true,
                    fillColor: context.colors.textFieldBackgroundColor,
                    hintText: context.localization.hintext_task_search,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: context.colors.allPageTextColor),
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: tabController,
            indicatorColor: context.colors.activeColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: context.colors.whitetask,
            unselectedLabelColor: context.colors.greyColor,
            tabs: [
              Tab(
                child: Text(
                  context.localization.Upcoming,
                  style: context.style.fontSize18Weight700,
                ),
              ),
              Tab(
                child: Text(
                  context.localization.All,
                  style: context.style.fontSize18Weight700,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            switch (state.status) {
              case LoadingStatus.pure:
                context.read<TaskBloc>().add(
                  LoadingTask(),
                );
                return const SizedBox();
              case LoadingStatus.loading:
                return const CupertinoActivityIndicator();
              case LoadingStatus.loadedWithSuccess:
                return state.isSearching
                    ? ListView.separated(

                  itemBuilder: (context, index) {
                    return TaskItem(
                      task: state.searchedTask[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(16);
                  },
                  itemCount: state.searchedTask.length,
                )
                    : TabBarView(
                  controller: tabController,
                  children: [
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return TaskItem(
                          task: state.upcomingList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(16);
                      },
                      itemCount: state.upcomingList.length,
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return TaskItem(
                          task: state.taskList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(16);
                      },
                      itemCount: state.taskList.length,
                    )
                  ],
                );
              default:
                return const SizedBox();
            }
          },
        ),
      );
    });
  }
}

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem({
    super.key,
    required this.task,
  });

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
  if (date.hour > -12) {
    final soat = date.hour >= 12 ? date.hour - 12 : date.hour;
    final hour = soat < 10 ? '0$soat' : '$soat';
    final minute = date.minute < 10 ? '0${date.minute}' : '${date.minute}';

    return "$hour:$minute PM";
  } else {
    final soat = date.hour >= 12 ? date.hour - 12 : date.hour;
    final hour = soat < 10 ? '0$soat' : '$soat';
    final minute = date.minute < 10 ? '0${date.minute}' : '${date.minute}';

    return "$hour:$minute AM";
  }
}