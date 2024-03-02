import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/statistics/widgets/stats_info.dart';

class StatsItem extends StatelessWidget {
  const StatsItem({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final today=DateTime.now();
    final List<String> dayTime = [
      "10:00",
      "11:00",
      "12:00",
      "13:00",
      "14:00",
      "15:00",
      "16:00",
      "17:00",
      "18:00",
      "19:00",
      "20:00",
    ];
    final List<String> tasks = [
      "Create navigation bar",
      "Study for testing",
      "Room cleaning",
      "Read Surah Al-Baqarah"
    ];
    final List<Color> colors = [
      context.colors.notesGreenBook1,
      context.colors.blueGradient,
      context.colors.orange,
      context.colors.statsPink,
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
           Row(
            children: [
              Expanded(
                child: StatsInfoWidget(
                  title: 'Today',
                  subtitle: '${today.day} ${DateFormat('MMMM').format(today)}',
                ),
              ),
              const Gap(12),
              const Expanded(
                child: StatsInfoWidget(
                  title: 'Focus Time',
                  subtitle: '4h 30m',
                ),
              ),
            ],
          ),
          const Gap(12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: context.colors.darkBlue,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...List.generate(
                              dayTime.length,
                              (i) => Text(
                                dayTime[i],
                                style: context.style.fontSize14Weight500,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              tasks.length,
                              (i) => Container(
                                decoration: BoxDecoration(
                                    color: context.colors.statsTaskBackground,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(children: [
                                  Container(
                                    width: 10,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: colors[i],
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        )),
                                  ),
                                  const Gap(10),
                                  Text(
                                    tasks[i],
                                    style: context.style.fontSize14Weight500,
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),   
        ],

      ),
      
    );
  }
}
