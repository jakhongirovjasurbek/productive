import 'package:flutter_svg/svg.dart';
import 'package:productive/assets/app_decoration.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../models/expenseone_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpenseoneItemWidget extends StatelessWidget {
  ExpenseoneItemWidget(
    this.expenseoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ExpenseoneItemModel expenseoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: AppDecoration.fillRed.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.imgBxRestaurant,
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                  top: 4,
                ),
                child: Text(
                  expenseoneItemModelObj.eyeDoctorReview!,
                  style: context.style.fontSize16Weight700.copyWith(
                    color: context.colors.whiteA700,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: '\$',
                        style: context.style.fontSize18Weight500,
                      ),
                      TextSpan(
                        text: '20',
                        style: context.style.fontSize18Weight500,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Opacity(
            opacity: 0.8,
            child: Container(
              width: 276,
              margin: const EdgeInsets.only(right: 42),
              child: Text(
                expenseoneItemModelObj.iThoughtRozan!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.style.fontSize14Weight400,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              expenseoneItemModelObj.time!,
              style: context.style.fontSize10Weight400,
            ),
          ),
        ],
      ),
    );
  }
}
