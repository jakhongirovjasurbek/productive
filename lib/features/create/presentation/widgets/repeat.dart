import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import 'bottom_sheet.dart';

class RepeatWidget extends StatefulWidget {
  const RepeatWidget({Key? key}) : super(key: key);

  @override
  State<RepeatWidget> createState() => _RepeatWidgetState();
}

class _RepeatWidgetState extends State<RepeatWidget> {
  String selectedRepeat = "Once";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openBottomSheet(context);
      },
      child: Container(
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
            Text(selectedRepeat,
                style: context.style.fontSize16Weight500Grey),
            const SizedBox(width: 8),
            SvgPicture.asset(AppIcons.down),
          ],
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet(
          onSelected: (String selected) {
            setState(() {
              selectedRepeat = selected;
            });
          },
        );
      },
    );
  }
}