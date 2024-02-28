import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/route_names/app_route_name.dart';
import '../../assets/icons.dart';
import 'package:productive/features/authentication/presentation/pages/forgot_password.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouteNames.onboarding, (_) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(40),
        child: const CupertinoActivityIndicator(
          radius: 16,
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 80),
        Center(
          child: SvgPicture.asset(AppIcons.logo),
        ),
        const SizedBox(height: 12),
        Text(
          context.localization.productive,
          style: context.style.fontSize40Weight700,
        ),
      ]),
    );
  }
}
