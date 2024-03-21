import 'package:flutter/material.dart';
import 'package:productive/core/extensions/data_time_extension.dart';
import 'package:productive/core/extensions/extensions.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
  });

  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final bool isPassed = date.isBefore(DateTime.now());
    final isToday = date.isToday;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 7,
        ),
        alignment: Alignment.center,
        height: 37,
        width: 37,
        decoration: isSelected
            ? BoxDecoration(
                    color: context.colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  )
            : !isActiveMonth
                ? const BoxDecoration(
                    color: null,
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.colors.linkColorBackground,
                  ),
        child: Text(
          number.toString(),
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? context.colors.white
                : isPassed
                    ? isActiveMonth
                        ? context.colors.white
                        : Colors.transparent
                    : isActiveMonth
                        ? context.colors.white
                        : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
