import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/tasks1/presentation/pages/drawer.dart';
import '../../../assets/colors.dart';

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
    return Builder(
      builder: (context) {
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
                        onTap: () {},
                        child: SvgPicture.asset(context.icons.notyfication),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {},
                    cursorColor: context.colors.orange,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                            color: context.colors.textFieldBackgroundColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 13.5),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          context.icons.expanse_categories_search_task,
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
                unselectedLabelColor: AppColors.greyish,
                tabs: [
                  Tab(
                    child: Text(
                      context.localization.Upcoming,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      context.localization.All,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(
                    title: context.localization.tasks,
                    startDate: DateTime.now(),
                    endDate: DateTime.now(),
                    icon: context.icons.study,
                    priority: Priority.low,
                    checkout: true,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Gap(16);
                },
                itemCount: 1,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return Container();
                },
                separatorBuilder: (context, index) {
                  return const Gap(16);
                },
                itemCount: 1,
              )
            ],
          ),
        );
      },
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  final String? link;
  final String icon;
  final bool checkout;
  final Priority priority;

  TaskItem({
    required this.title,
    this.description,
    required this.startDate,
    required this.endDate,
    this.link,
    required this.icon,
    required this.checkout,
    required this.priority,
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
              color: getPriorityColor(priority),
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
                  width: 55,
                  height: 55,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(icon),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: context.colors.white,
                          decoration: checkout
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    const Gap(2),
                    Text(
                      '${formatTime(startDate)} - ${formatTime(endDate)}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: context.colors.white,
                          decoration: checkout
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: GestureDetector(
                      onTap: () {},
                      child: checkout
                          ? SvgPicture.asset(context.icons.unchecked)
                          : SvgPicture.asset(context.icons.checked)),
                ),
              ],
            ),
            if (description != "" && description != null) ...{
              const Gap(8),
              Text(
                description!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: context.colors.whitetask,
                      decoration: checkout
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

Color getPriorityColor(Priority priority) {
  switch (priority) {
    case Priority.high:
      return AppColors.redPriorty;
    case Priority.medium:
      return AppColors.yellowPriority;
    default:
      return AppColors.greenPriority;
  }
}

enum Priority { high, medium, low }
