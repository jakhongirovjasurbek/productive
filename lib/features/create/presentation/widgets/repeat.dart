import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';

class RepeatWidget extends StatelessWidget {
  const RepeatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.backgroundColor,
        ),
        height: 42,
        width: 194,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 11, 15, 12),
              child: Text(context.localization.repeat,
                  style: context.style.fontSize16Weight500Blue),
            ),
            const SizedBox(width: 24),
            Text(context.localization.once,
                style: context.style.fontSize16Weight500Grey),
            const SizedBox(width: 8),
            SvgPicture.asset(AppIcons.down),
          ],
        ),
      );
  }
}
