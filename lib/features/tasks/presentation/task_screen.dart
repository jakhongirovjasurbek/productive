import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/route_names/task_name.dart';
import 'package:productive/features/create/presentation/pages/create_task.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:productive/features/tasks/presentation/pages/drawer.dart';
import 'package:productive/features/tasks/data/models/status.dart';
import 'package:productive/features/tasks/presentation/widgets/task_item.dart';


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
                context.read<TaskBloc>().add(LoadingTask());
                // context.read<TaskBloc>().add(CheckedTask(index: t));
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
                return Container(color: Colors.red,width: 40,height: 40,);
            }
          },
        ),
      );
    });
  }
}
