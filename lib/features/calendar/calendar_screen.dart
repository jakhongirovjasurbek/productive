import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        title: Text(context.localization.calendar, ),
      ), 
      body: Center(child: Text("Calendar"),),
    );
  }
}