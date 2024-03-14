import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/data/model/income_model.dart';

import '../../../../assets/icons.dart';

void showBottomSheetWidget(BuildContext context, IncomeModel model) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 100 * 27.8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: context.colors.bottomSheetBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                        color: context.colors.bottomSheetDate.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(AppIcons.exit),
                  ),
                ],
              ),
            ),
            const Gap(24),
            Divider(
              color: context.colors.dividerBgColor,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.colors.meetingColor,
                      ),
                      padding: EdgeInsets.all(9),
                      child: SvgPicture.asset(
                        AppIcons.moneyFirst,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      context.localization.salary,
                      style: context.style.fontSize20Weight500,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: context.colors.dividerBgColor,
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: context.colors.addButtonLinear1,
                            ),
                            padding: EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              AppIcons.plus,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            context.localization.salary,
                            style: context.style.fontSize20Weight500,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(AppIcons.premium),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
