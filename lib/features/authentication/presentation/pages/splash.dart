import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/login');
        },
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                SvgPicture.asset(AppIcons.logo),
                const CupertinoActivityIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
