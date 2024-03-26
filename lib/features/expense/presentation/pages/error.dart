import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "error",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
