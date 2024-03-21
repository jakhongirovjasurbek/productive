import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/extensions/data_time_extension.dart';
import 'package:productive/features/calendar/presentation/widgets/calendar_body.dart';
import 'package:productive/features/calendar/presentation/widgets/header.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime selectedMonth;

  DateTime? selectedDate;

  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height/100)*40,
        child: Column(
          children: [
            Header(
              selectedMonth: selectedMonth,
              selectedDate: selectedDate,
              onChange: (DateTime value) => setState(
                () {
                  selectedDate = value;
                },
              ),
            ),
            Expanded(
              child: Body(
                selectedMonth: selectedMonth,
                selectedDate: selectedDate,
                selectDate: (DateTime value) => setState(
                  () {
                    selectedDate = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
