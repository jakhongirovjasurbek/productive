import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productive/assets/app_route_names.dart';
import 'package:productive/core/extensions/extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, AppRouteNames.notification));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.localization.productive,
          style: context.style.fontSize40Weight700,
        ),
      ),
    );
  }
}
