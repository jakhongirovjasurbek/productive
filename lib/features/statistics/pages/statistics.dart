import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/statistics/widgets/sliding_segment.dart';
import 'package:productive/features/statistics/widgets/stats_item.dart';

enum StatsCategory {
  daily(
    "Daily",
  ),
  weekly("Weekly"),
  monthly("Monthly"),
  yearly("Yearly");

  const StatsCategory(
    this.message,
  );
  final String message;
}

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with TickerProviderStateMixin {
  var currentIndex = 0;
  late TabController controller;
  late PageController pageController;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    pageController = PageController(
      initialPage: currentIndex,
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.mainDark,
        centerTitle: true,
        title: Text(
          localization.stats,
          style: TextStyle(
              color: context.colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            CustomOnboardingSlidingSegmentedControl(
              children: StatsCategory.values.map((e) => e.message).toList(),
              onValueChanged: (value) {
                currentIndex = value;
                pageController.jumpToPage(value);
              },
            ),
            const Gap(15),
             Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (value) {
                  pageController.jumpToPage(value);
                  currentIndex = value;
                },
                children: [
                  StatsItem(currentIndex: currentIndex),
                  Center(
                    child: Text(
                      "Weekly",
                      style: context.style.fontSize16Weight500,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Monthly",
                      style: context.style.fontSize16Weight500,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Yearly",
                      style: context.style.fontSize16Weight500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
