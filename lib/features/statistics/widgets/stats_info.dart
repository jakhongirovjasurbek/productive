
import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class StatsInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const StatsInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            color: context.colors.darkBlue,
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.style.fontSize18Weight500
                  .copyWith(color: context.colors.statsTextColor),
            ),
            Text(
              subtitle,
              style: context.style.fontSize20Weight500,
            ),
          ],
        ),
      ),
    );
  }
}
