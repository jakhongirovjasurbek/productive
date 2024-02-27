import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(AppIcons.bold),
        ),
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(context.localization.create_event,
              style: context.style.fontSize24Weight700),
        ),
        backgroundColor: AppColors.mainDark,
      ),

      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 20, 27),
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.meet),
                    SizedBox(height: 8),
                    Text(context.localization.meet,
                        style: context.style.fontSize14Weight400),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 20, 27),
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.birthday),
                    SizedBox(height: 8),
                    Text(context.localization.birthday,
                        style: context.style.fontSize14Weight400),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 20, 27),
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.online),
                    SizedBox(height: 8),
                    Text(context.localization.online,
                        style: context.style.fontSize14Weight400),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 20, 20, 27),
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.other),
                    SizedBox(height: 8),
                    Text(context.localization.other,
                        style: context.style.fontSize14Weight400),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.loginTextFieldBackgroundColor,
                border:
                    Border.all(color: AppColors.unactivatedColor, width: 0.38),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  hintText: context.localization.event_title,
                  hintStyle: context.style.fontSize18Weight500Grey,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Divider(
              color: AppColors.whiteLabel.withOpacity(0.2),
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 300, 12),
            child: Text(context.localization.start_date,
                style: context.style.fontSize16Weight500Blue),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.loginTextFieldBackgroundColor,
                border:
                    Border.all(color: AppColors.unactivatedColor, width: 0.38),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 13, 0, 12),
                  hintText: context.localization.date,
                  hintStyle: context.style.fontSize14Weight400Grey,
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 13, 8, 13),
                    child: SvgPicture.asset(AppIcons.start),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 308, 12),
            child: Text(context.localization.end_date,
                style: context.style.fontSize16Weight500Blue),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.loginTextFieldBackgroundColor,
                border:
                    Border.all(color: AppColors.unactivatedColor, width: 0.38),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 13, 0, 12),
                  hintText: context.localization.date,
                  hintStyle: context.style.fontSize14Weight400Grey,
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 13, 8, 13),
                    child: SvgPicture.asset(AppIcons.end),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 28, 60, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.loginTextFieldBackgroundColor,
                  ),
                  height: 42,
                  width: 129,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 11, 15, 12),
                        child: Text(context.localization.all_day,
                            style: context.style.fontSize16Weight500Blue),
                      ),
                      SvgPicture.asset(AppIcons.switch_),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.loginTextFieldBackgroundColor,
                  ),
                  height: 42,
                  width: 194,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 11, 15, 12),
                        child: Text(context.localization.repeat,
                            style: context.style.fontSize16Weight500Blue),
                      ),
                      SizedBox(width: 24),
                      Text(context.localization.once,
                          style: context.style.fontSize16Weight500Grey),
                      SizedBox(width: 8),
                      SvgPicture.asset(AppIcons.down),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Divider(
              color: AppColors.whiteLabel.withOpacity(0.2),
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Container(
              height: 147,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.loginTextFieldBackgroundColor,
                border:
                    Border.all(color: AppColors.unactivatedColor, width: 0.38),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  hintText: context.localization.add_note,
                  hintStyle: context.style.fontSize14Weight500Grey,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.skipButtonColor,
              ),
              child: Center(
                  child: Text(
                context.localization.save,
                style: context.style.fontSize16Weight500,
              )),
              height: 40,
              width: 380,
            ),
          )
        ],
      ),
    );
  }
}
