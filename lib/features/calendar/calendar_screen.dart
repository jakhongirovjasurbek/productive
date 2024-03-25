import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/widgets/w_calendar.dart';
import 'package:productive/features/calendar/presentation/bloc/task_bloc/calendar_bloc.dart';
import 'package:productive/features/calendar/presentation/widgets/calendar_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.colors.mainDark,
        title: Text(
          context.localization.calendar,
          style: context.style.fontSize30Weight700,
        ),
      ),
      body: BlocBuilder<CalendarTaskBloc, CalendarTaskState>(
        builder: (context, state) {
          if (state.status == CalendarStatus.succsess) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CalendarWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(),
                  ),
                  const SliverToBoxAdapter(
                    child: Gap(20),
                  ),
                  SliverList.builder(
                    itemCount: state.dailyTask.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: WCalendarWidget(
                          iconColor: getIconColor(state.dailyTask[index].iconColor, context),
                          icon: state.dailyTask[index].icon,
                          description: state.dailyTask[index].description == ''
                              ? null
                              : state.dailyTask[index].description,
                          title: state.dailyTask[index].title,
                          startTime: formatTime(
                            state.dailyTask[index].startTime,
                          ),
                          endTime: formatTime(
                            state.dailyTask[index].endTime,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state.status == CalendarStatus.pure) {
            context.read<CalendarTaskBloc>().add(
                  CalendarBlocStarted(),
                );
            return const SizedBox();
          } else if (state.status == CalendarStatus.loading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return Center(
              child: SizedBox(
                child: Text(
                  "ERROR",
                  style: context.style.fontSize18Weight700,
                ),
              ),
            );
          }
        },
      ),
    );
  }
  getIconColor(String iconColor, BuildContext context) {
  switch (iconColor) {
    case 'pinkColor':
      return context.colors.studyColor;
    case 'orangeColor':
      return AppColors.gymColor;
    case 'greenColor':
      return context.colors.meetingColor;
    case 'blueColor':
      return context.colors.onBordingSkip;
    default:
      return context.colors.workColor;
  }
}
}
