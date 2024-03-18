import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
                    child: Gap(20),
                  ),
                  SliverList.builder(
                    itemCount: state.datas.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: WCalendarWidget(
                          icon: state.datas[index].icon,
                          description: state.datas[index].description == ''
                              ? null
                              : state.datas[index].description,
                          title: state.datas[index].title,
                          startTime: formatTime(
                            state.datas[index].startTime,
                          ),
                          endTime: formatTime(
                            state.datas[index].endTime,
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
            return const SizedBox();
          }
        },
      ),
    );
  }
}
