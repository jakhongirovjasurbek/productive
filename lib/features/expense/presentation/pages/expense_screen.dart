import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.bold),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            context.localization.expenses,
            style: context.style.fontSize24Weight700,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.settings,
              width: 24.0,
              height: 24.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.expensesBackground,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(4.67, 5.13, 5.13, 5.16),
                          child: SvgPicture.asset(
                            AppIcons.arrowGreen,
                            width: 28.0,
                            height: 28.0,
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              context.localization.income,
                              style: context.style.fontSize14Weight500whitish,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              context.localization.cost500,
                              style: context.style.fontSize24Weight600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55.0, right: 44.0),
                      child: VerticalDivider(
                        color: context.colors.expensesDivider.withOpacity(0.3),
                        thickness: 1,
                        width: 20,
                        endIndent: 10,
                        indent: 10,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(4.67, 5.13, 5.13, 5.16),
                          child: SvgPicture.asset(
                            AppIcons.arrowRed,
                            width: 28.0,
                            height: 28.0,
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              context.localization.outcome,
                              style: context.style.fontSize14Weight500whitish,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              context.localization.cost700,
                              style: context.style.fontSize24Weight600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.localization.categories,
                    style: context.style.fontSize18Weight600,
                  ),
                  Text(
                    context.localization.see_all,
                    style: context.style.fontSize16Weight400blue,
                  ),
                ],
              ),
              const Gap(26),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Center(
                      child: Container(
                        height: 195,
                        width: 106,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 106,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: context
                                      .colors.loginTextFieldBackgroundColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.food,
                                    width: 45,
                                    height: 45,
                                  ),
                                  const Gap(18),
                                  Text(
                                    context.localization.food,
                                    style:
                                        context.style.fontSize16Weight500orange,
                                  ),
                                  const Gap(2),
                                  Center(
                                    child: Text(
                                      context.localization.cost150,
                                      style: context.style.fontSize16Weight500,
                                    ),
                                  ),
                                  const Gap(23),
                                  SvgPicture.asset(
                                    AppIcons.orangeVector,
                                    width: 106,
                                    height: 23.61,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(12),
                    Center(
                      child: Container(
                        height: 195,
                        width: 106,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 106,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: context
                                      .colors.loginTextFieldBackgroundColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.shopping,
                                    width: 45,
                                    height: 45,
                                  ),
                                  const Gap(18),
                                  Text(
                                    context.localization.shopping,
                                    style:
                                        context.style.fontSize16Weight500blue,
                                  ),
                                  const Gap(2),
                                  Center(
                                    child: Text(
                                      context.localization.cost20,
                                      style: context.style.fontSize16Weight500,
                                    ),
                                  ),
                                  const Gap(14),
                                  SvgPicture.asset(
                                    AppIcons.blueVector,
                                    width: 105,
                                    height: 22,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(12),
                    Center(
                      child: Container(
                        height: 195,
                        width: 106,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 106,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: context
                                      .colors.loginTextFieldBackgroundColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.gift,
                                    width: 45,
                                    height: 45,
                                  ),
                                  const Gap(18),
                                  Text(
                                    context.localization.gift,
                                    style:
                                        context.style.fontSize16Weight500purple,
                                  ),
                                  const Gap(2),
                                  Center(
                                    child: Text(
                                      context.localization.cost150,
                                      style: context.style.fontSize16Weight500,
                                    ),
                                  ),
                                  const Gap(12),
                                  SvgPicture.asset(
                                    AppIcons.purpleVector,
                                    width: 103.48,
                                    height: 41.43,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(12),
                    Center(
                      child: Container(
                        height: 195,
                        width: 106,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 106,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: context
                                      .colors.loginTextFieldBackgroundColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.food,
                                    width: 45,
                                    height: 45,
                                  ),
                                  const Gap(18),
                                  Text(
                                    context.localization.food,
                                    style:
                                        context.style.fontSize16Weight500orange,
                                  ),
                                  const Gap(2),
                                  Center(
                                    child: Text(
                                      context.localization.cost150,
                                      style: context.style.fontSize16Weight500,
                                    ),
                                  ),
                                  const Gap(23),
                                  SvgPicture.asset(
                                    AppIcons.orangeVector,
                                    width: 106,
                                    height: 23.61,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.localization.today_transactions,
                    style: context.style.fontSize18Weight600,
                  ),
                  Text(
                    context.localization.see_all,
                    style: context.style.fontSize16Weight400blue,
                  ),
                ],
              ),
              const Gap(16),
              Stack(children: [
                Container(
                  height: 93,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 6, left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.notificationsClear.withOpacity(0.3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 23,
                                width: 21,
                                child: SvgPicture.asset(AppIcons.heart),
                              ),
                              const Gap(6),
                              Text(
                                context.localization.eye_doctor_review,
                                style: context.style.fontSize16Weight500,
                              ),
                            ],
                          ),
                          Text(
                            context.localization.cost_minus20,
                            style: context.style.fontSize18Weight500red,
                          ),
                        ],
                      ),
                      const Gap(8),
                      Text(
                        context.localization
                            .i_thought_Rozan_had_bad_designs_but_the_doctor_gave_me_new_glasses,
                        style: context.style.fontSize14Weight400grey,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 6,
                    right: 12,
                    child: Text(
                      context.localization.time9_43_am,
                      style: context.style.fontSize10Weight400,
                    ))
              ]),
              const SizedBox(height: 12),
              Stack(children: [
                Container(
                  height: 58,
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.only(bottom: 6, left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.expensesGreen2.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(AppIcons.motorcycle),
                          ),
                          const Gap(6),
                          Text(
                            context.localization.saving_transportation_expenses,
                            style: context.style.fontSize16Weight500,
                          ),
                        ],
                      ),
                      Text(
                        context.localization.cost_plus50,
                        style: context.style.fontSize18Weight500green,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 6,
                    right: 12,
                    child: Text(
                      context.localization.time11_30_pm,
                      style: context.style.fontSize10Weight400,
                    ))
              ]),
              Stack(children: [
                Container(
                  height: 93,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 6, left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.expensesGreen2.withOpacity(0.3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 23,
                                width: 21,
                                child: SvgPicture.asset(AppIcons.heart),
                              ),
                              const Gap(6),
                              Text(
                                context.localization.eye_doctor_review,
                                style: context.style.fontSize16Weight500,
                              ),
                            ],
                          ),
                          Text(
                            context.localization.cost_plus20,
                            style: context.style.fontSize18Weight500green,
                          ),
                        ],
                      ),
                      const Gap(8),
                      Text(
                        context.localization
                            .the_doctor_returned_my_money_after_I_was_satisfied_with_Rozan_designs,
                        style: context.style.fontSize14Weight400grey,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 6,
                    right: 12,
                    child: Text(
                      context.localization.time2_50_pm,
                      style: context.style.fontSize10Weight400,
                    ))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
