import 'package:flutter/material.dart';
import 'package:productive/core/extensions/data_time_extension.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
    required this.data,
  });
  final List<CalendarEntities> data;
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final bool isPassed = date.isBefore(DateTime.now());
    final isToday = date.isToday;
    final kun = data
        .where((element) =>
            element.startTime.month == date.month &&
            element.startTime.day == date.day &&
            element.startTime.year == date.year)
        .toList();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 7,
        ),
        alignment: Alignment.center,
        height: (MediaQuery.of(context).size.height / 100) * 4.6,
        width: (MediaQuery.of(context).size.height / 100) * 4.6,
        decoration: isSelected
            ? isActiveMonth
                ? BoxDecoration(
                    color: context.colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  )
                : !isActiveMonth
                    ? BoxDecoration(
                        color: context.colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.colors.linkColorBackground,
                      )
            : BoxDecoration( 
              borderRadius: BorderRadius.circular(10),
                        color: context.colors.linkColorBackground,
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Text(
                number.toString(),
                style: context.style.fontSize14Weight500.copyWith(
                  color: isActiveMonth ? context.colors.white : Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ((MediaQuery.of(context).size.height / 100) * 4.6) - 13),
              child: data.any(
                (element) =>
                    element.startTime.month == date.month &&
                    element.startTime.day == date.day &&
                    element.startTime.year == date.year,
              )
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          kun.length,
                          (index) {
                            return Container(
                              height: 13,
                              width:
                                  ((MediaQuery.of(context).size.height / 100) *
                                          4.6) /
                                      kun.length,
                              decoration: BoxDecoration(
                                color: getCalendarColor(
                                  kun[index].priority,
                                  context,
                                ),
                                borderRadius: kun.length == 1
                                    ? const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )
                                    : index == 0
                                        ? const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                          )
                                        : index == kun.length - 1
                                            ? const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                              )
                                            : null,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

Color getCalendarColor(String color, BuildContext context) {
  switch (color) {
    case "low":
      return context.colors.expensesGreen;
    case "high":
      return context.colors.notificationsClear;

    default:
      return context.colors.expensesTransport;
  }
}
