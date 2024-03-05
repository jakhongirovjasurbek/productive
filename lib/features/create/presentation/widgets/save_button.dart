import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/colors.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.skipButtonColor,
        ),
        height: 40,
        width: 380,
        child: Center(
            child: Text(
              context.localization.save,
              style: context.style.fontSize16Weight500,
            )),
      );
  }
}
