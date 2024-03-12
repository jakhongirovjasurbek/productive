import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';

import 'package:productive/core/widgets/w_button.dart';
import 'package:productive/features/tasks/create/presentation/widgets/modal_widget.dart';

Future<DateTime?> selectTime(BuildContext context) async {
  DateTime callingDate = DateTime.now();
  await showCupertinoModalPopup(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        decoration: BoxDecoration(
            color: context.colors.bottomSheetBgColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        height: 268,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ExitBar(),
              const Gap(65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${callingDate.day} / ${callingDate.month} / ${callingDate.year}',
                    style: context.style.fontSize20Weight500.copyWith(
                        color: context.colors.white,
                        decorationColor: context.colors.bottomSheetBgColor),
                  )
                ],
              ),
              const Gap(26),
              const LineDivider(),
              const Gap(21),
              CustomTextButton(
                context: context,
                leftPadding: 17,
                title: context.localization.add_time,
                onTap: () {
                  showCupertinoModalPopup(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext builderContext) {
                      return Container(
                        decoration: BoxDecoration(
                            color: context.colors.bottomSheetBgColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        height: 378,
                        child: Column(
                          children: [
                            const ExitBar(),
                            const Gap(20),
                            Expanded(
                              child: CupertinoDatePicker(
                                dateOrder: DatePickerDateOrder.dmy,
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: callingDate,
                                onDateTimeChanged: (DateTime newDateTime) {
                                  callingDate = newDateTime;
                                },
                                use24hFormat: false,
                                minuteInterval: 1,
                              ),
                            ),
                            const Gap(22),
                            const LineDivider(),
                            const Gap(16),
                            CustomTextButton(
                              context: context,
                              leftPadding: 17,
                              title: context.localization.add_time,
                              onTap: () {
                                showCupertinoModalPopup(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext builderContext) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF303745),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24))),
                                      height: 378,
                                      child: Column(
                                        children: [
                                          const ExitBar(),
                                          const Gap(36),
                                          Text(
                                            '${callingDate.day} / ${callingDate.month} / ${callingDate.year}',
                                            style: context
                                                .style.fontSize20Weight500
                                                .copyWith(
                                                    color: context.colors.white,
                                                    decorationColor: context
                                                        .colors
                                                        .bottomSheetBgColor),
                                          ),
                                          const Gap(26),
                                          const LineDivider(),
                                          const Gap(14),
                                          Expanded(
                                            child: CupertinoDatePicker(
                                              mode:
                                                  CupertinoDatePickerMode.time,
                                              initialDateTime: callingDate,
                                              onDateTimeChanged:
                                                  (DateTime newDateTime) {
                                                callingDate =
                                                    callingDate.copyWith(
                                                  hour: newDateTime.hour,
                                                  minute: newDateTime.minute,
                                                );
                                              },
                                              use24hFormat: false,
                                              minuteInterval: 1,
                                            ),
                                          ),
                                          const Gap(35),
                                          CustomTextButton(
                                            context: context,
                                            leftPadding: 17,
                                            title: context
                                                .localization.remove_time,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          const Gap(4),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: LineDivider(
                                              height: 1,
                                              width: 74,
                                            ),
                                          ),
                                          const Gap(7),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .padding
                                                        .bottom +
                                                    8),
                                            child: WButton(
                                              /*  padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .padding
                                                      .bottom), */
                                              width: 121,
                                              height: 30,
                                              text:
                                                  context.localization.confirm,
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const Gap(4),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: LineDivider(
                                height: 1,
                                width: 74,
                              ),
                            ),
                            const Gap(7),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).padding.bottom +
                                          8),
                              child: WButton(
                                padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).padding.bottom),
                                width: 121,
                                height: 30,
                                text: context.localization.confirm,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  // _selectDate(context,callingDate);
                },
              ),
              const Gap(4),
              const Align(
                alignment: Alignment.centerLeft,
                child: LineDivider(
                  height: 1,
                  width: 74,
                ),
              ),
              const Gap(14),
              WButton(
                width: 121,
                height: 30,
                text: context.localization.confirm,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
  return callingDate;
}
