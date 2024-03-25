import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/features/calendar/presentation/bloc/task_bloc/calendar_bloc.dart';
import 'package:productive/features/calendar/presentation/widgets/calendar_body.dart';
import 'package:productive/features/calendar/presentation/widgets/header.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  

 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarTaskBloc, CalendarTaskState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
             height: (MediaQuery.of(context).size.height / 100) * 47,
            child: Column(
              children: [
                Header(
                    selectedMonth: state.selectedMonth,
                    selectedDate: state.selectedDate,
                    onChange: (DateTime value) {
                      context.read<CalendarTaskBloc>().add(
                            HeaderEvent(
                              value: value,
                            ),
                          );
                    }),
                Expanded(
                  child: Body(
                    datas: state.datas,
                    selectedMonth: state.selectedMonth,
                    selectedDate: state.selectedDate,
                    selectDate: (DateTime value) {
                      context.read<CalendarTaskBloc>().add(
                            SelectDateEvent(
                              value: value,
                            ),
                          );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
