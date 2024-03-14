import 'package:flutter/cupertino.dart';
import 'package:productive/core/extensions/extensions.dart';

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
                  padding: const EdgeInsets.fromLTRB(15, 11, 0, 12),
                  child: Text(
                    context.localization.all_day,
                    style: context.style.fontSize16Weight500Blue,
                  ),
                ),
                Transform.scale(
                  scale: 0.8, // Adjust the scale factor as needed
                  child: CupertinoSwitch(
                    activeColor: context.colors.skipButtonColor,
                    value: isSwitchOn,
                    onChanged: (change) {
                      setState(() {
                        isSwitchOn = change;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
