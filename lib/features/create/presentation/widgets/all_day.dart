import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../../../../assets/icons.dart';

class AllDayWidget extends StatefulWidget {
  const AllDayWidget({super.key});

  @override
  State<AllDayWidget> createState() => _AllDayWidgetState();
}

class _AllDayWidgetState extends State<AllDayWidget> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.colors.backgroundColor,
            ),
            height: 42,
            width: 126,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 11, 15, 12),
                  child: Text(
                    context.localization.all_day,
                    style: context.style.fontSize16Weight500Blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSwitchOn = !isSwitchOn;
                    });
                  },
                  child: isSwitchOn
                      ? SvgPicture.asset(AppIcons.switch_on)
                      : SvgPicture.asset(AppIcons.switch_off),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
