import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/icons.dart';

class IconSelectionWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onIconTapped;

  IconSelectionWidget({Key? key, required this.selectedIndex, this.onIconTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
              (index) => GestureDetector(
            onTap: () => onIconTapped?.call(index),
            child: Column(

              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == selectedIndex
                        ? context.colors.expensesGift
                        : context.colors.skipButtonColor,
                  ),
                  height: 40,
                  width: 40,
                  child: Transform.scale(
                    scale: 0.65,
                    child: SvgPicture.asset(
                      _getIconAsset(index),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getIconText(context, index),
                  style: context.style.fontSize14Weight400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getIconAsset(int index) {
    switch (index) {
      case 0:
        return AppIcons.communication;
      case 1:
        return AppIcons.birthday;
      case 2:
        return AppIcons.meeting;
      case 3:
        return AppIcons.starEvent;
      default:
        return '';
    }
  }

  String _getIconText(BuildContext context, int index) {
    switch (index) {
      case 0:
        return context.localization.meet;
      case 1:
        return context.localization.birthday;
      case 2:
        return context.localization.online;
      case 3:
        return context.localization.other;
      default:
        return '';
    }
  }
}
