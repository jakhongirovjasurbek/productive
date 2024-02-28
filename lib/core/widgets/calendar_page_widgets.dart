import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WCalendarWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final String? description;
  final String? link;
  final String startTime;
  final String endTime;
  final String? icon;
  final Color? backGroundColor;
  final TextStyle? titleStyle;
  final TextStyle? dateTimeStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? linkStyle;
  final double? linkWidth;

  const WCalendarWidget({
    Key? key,
    required this.title,
    this.description,
    this.link,
    required this.startTime,
    required this.endTime,
    this.icon,
    this.backGroundColor,
    this.width,
    this.height,
    this.titleStyle,
    this.dateTimeStyle,
    this.descriptionStyle,
    this.linkWidth,
    this.linkStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
      ),
      height: height,
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backGroundColor ?? context.colors.loginTextFieldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ?? context.style.fontSize16Weight600,
          ),
          if (description != null)...{
            const Gap(4),
            Text(
              description!,
              style: descriptionStyle ??
                  context.style.fontSize14Weight400.copyWith(
                    color: AppColors().tasksTimeColor,
                  ),
                  maxLines: 3, 
                  overflow: TextOverflow.ellipsis,
            ),
          },
          if (link != null) ...{
            const Gap(12),
            GestureDetector(
              onTap: () async{
                if(await canLaunchUrlString(link!)){
                  await launchUrlString(link!);
                }
              },
          child:  Container( 
            decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(4), 
                color: context.colors.linkColorBackground, 
            ),

              width: linkWidth ??
                  (MediaQuery.of(context).size.width / 100) * 32.27,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.link),
                  const Gap(8),
                  Text(
                    context.localization.link,
                    style: linkStyle ?? context.style.fontSize12Weight400,
                  ),
                  const Gap(8),
                ],
              ),
            ),
            )
          } else ...{
            const Gap(12),
          },
              const Gap(8),
          Row(
            children: [
              SvgPicture.asset(
                icon ?? AppIcons.calendarGymIcon,
              ),
              const Gap(7),
              Text(
                "$startTime $endTime",
                style: dateTimeStyle ??
                    context.style.fontSize14Weight400.copyWith(
                      color: AppColors().tasksTimeColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
