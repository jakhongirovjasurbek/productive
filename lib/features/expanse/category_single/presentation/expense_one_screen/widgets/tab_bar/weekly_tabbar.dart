import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/fl_charts/bar_chart_weekly.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/fl_charts/line_graph_monthly.dart';

class WeeklyTabBar extends StatefulWidget {

  final bool isPressed;
  const WeeklyTabBar({
    super.key, required this.isPressed,
  });
  @override
  State<WeeklyTabBar> createState() => _WeeklyTabBarState();
}

class _WeeklyTabBarState extends State<WeeklyTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: context.colors.bacgroundColor,
            child: Center(child: widget.isPressed ? WeeklyTabPage() :   const LineGraphMonthly(
              
              )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.localization.transactions,
                  style: context.style.fontSize20Weight700,
                ),
              ),
            ],
          ),
          const Gap(6),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.redContainerone,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(context.icons.imgBxRestaurant),
                      const Gap(10),
                      Text(
                        context.localization.eye_doctor_review,
                        overflow: TextOverflow.clip,
                        style: context.style.fontSize16Weight500.copyWith(
                          color: context.colors.whiteA700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '-\$20',
                        style: context.style.fontSize18Weight500.copyWith(
                          color: context.colors.redContainer,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: Text(
                              context.localization
                                  .eyes_doctor_review_red_description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.left,
                              style: context.style.fontSize14Weight400.copyWith(
                                color: context.colors.conteinerdescription,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '9:43 AM ',
                        style: context.style.fontSize10Weight400.copyWith(
                          color: context.colors.whiteA700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.maxFinite,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.greenContainer,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(context.icons.imgBxRestaurant),
                      const Gap(10),
                      Text(
                        context.localization.saving_transportation_expenses,
                        style: context.style.fontSize16Weight500.copyWith(
                          color: context.colors.whiteA700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '+\$50',
                        style: context.style.fontSize18Weight500.copyWith(
                          color: context.colors.greenContainernumber,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '11:30 PM ',
                        style: context.style.fontSize10Weight400.copyWith(
                          color: context.colors.whiteA700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.greenContainer,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(context.icons.imgBxRestaurant),
                      const Gap(10),
                      Text(
                        context.localization.eye_doctor_review,
                        overflow: TextOverflow.clip,
                        style: context.style.fontSize16Weight500.copyWith(
                          color: context.colors.whiteA700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '+\$20',
                        style: context.style.fontSize18Weight500.copyWith(
                          color: context.colors.greenContainernumber,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.localization
                              .eyes_doctor_review_green_description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: context.style.fontSize14Weight400.copyWith(
                            color: context.colors.conteinerdescription,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '2:50 PM ',
                        style: context.style.fontSize10Weight400.copyWith(
                          color: context.colors.whiteA700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Gap(12),
        ],
      ),
    );
  }
}
