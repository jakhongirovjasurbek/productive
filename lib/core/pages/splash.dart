import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/authentication/presentation/pages/forgot_password.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).push(CupertinoPageRoute(builder: (_)=>ForgotPassword()));
    });
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
