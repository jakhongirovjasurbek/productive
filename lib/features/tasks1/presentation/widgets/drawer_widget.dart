import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DrawerWidget extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String title;
  final Color? color;

  const DrawerWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(16),
          SvgPicture.asset(
            icon,
          ),
          const Gap(12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16, fontWeight: FontWeight.w500, color: color),
          )
        ],
      ),
    );
  }
}

enum DividerDirection { horizontal, vertical }

class WDivider extends StatelessWidget {
  final Color? color;
  final DividerDirection direction;

  const WDivider({
    this.direction = DividerDirection.horizontal,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isHorizontal = direction == DividerDirection.horizontal;
    return Container(
      height: isHorizontal ? 1 : double.maxFinite,
      width: isHorizontal ? double.maxFinite : 1,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onPrimary.withOpacity(.2),
      ),
    );
  }
}
