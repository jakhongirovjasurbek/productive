import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/widgets/calendar_page_widgets.dart';

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
        title: Padding(
          padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height / 100) * 2.96 +
                MediaQuery.of(context).padding.top,
            bottom: (MediaQuery.of(context).size.height / 100) * 2.7,
          ),
          child: Text(
            context.localization.calendar,
            style: context.style.fontSize30Weight700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            WCalendarWidget(
              link: "https://www.figma.com/file/4lp5DD321AzkmDRYBhus7h/Productive?node-id=1618%3A6968&mode=dev",
              title: "Gym time",
              startTime: formatTime(DateTime.now()),
              endTime: formatTime(DateTime.now()),
              description:
                  "We will discuss the new Tasks of the calendar pages",
            ),
            
          ],
        ),
      ),
    );
  }
}
