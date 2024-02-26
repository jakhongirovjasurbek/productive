import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
