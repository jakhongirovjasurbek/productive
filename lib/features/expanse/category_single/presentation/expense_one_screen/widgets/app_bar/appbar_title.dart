import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
         
             style: context.style.fontSize16Weight700.copyWith(
                    color: context.colors.whiteA700,
                  ),
        ),
      ),
    );
  }
}
