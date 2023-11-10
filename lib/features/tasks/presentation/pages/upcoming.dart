import 'package:flutter/material.dart';
import 'package:productive/main.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(authUser.user.toString()),
    );
  }
}
