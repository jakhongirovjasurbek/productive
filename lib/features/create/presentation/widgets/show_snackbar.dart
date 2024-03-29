import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/data/model/income_status.dart';
import 'package:productive/features/create/presentation/bloc/create_income/income_bloc.dart';

void showBottomSheetWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        width: double.maxFinite,

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
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                        color: context.colors.bottomSheetDate.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.network(context.icons.create_income_exit),
                  ),
                ],
              ),
            ),
            const Gap(24),
            Divider(
              color: context.colors.dividerBgColor,
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<IncomeBloc>()
                    .add(ChangePriority(priorityName: IncomePriority.salary));
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.colors.meetingColor,
                      ),
                      padding: const EdgeInsets.all(9),
                      child: SvgPicture.network(
                        context.icons.moneyFirst,
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
              onTap: () {
                context
                    .read<IncomeBloc>()
                    .add(ChangePriority(priorityName: IncomePriority.expense));
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: context.colors.addButtonLinear1,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.network(
                              context.icons.plus,
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
                    SvgPicture.network(context.icons.premium),
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
