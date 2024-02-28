import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/widgets/wcalendar_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          
          horizontal: 16,
        ),
        child: ListView.builder( 
          itemCount: 1,
          itemBuilder: (context, index) {
            return WCalendarWidget(
              
            // link: "https://www.figma.com/file/4lp5DD321AzkmDRYBhus7h/Productive?node-id=1618%3A6968&mode=dev",
              title: "Gym time",
              startTime: formatTime(DateTime.now(),),
              endTime: formatTime(DateTime.now(),),
              //  description:
              //      "We will discuss the new Tasks of the calendar pages",
            );
          },

        ),
      ),
    );
  }
}
