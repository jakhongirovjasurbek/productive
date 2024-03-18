import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/widgets/all_day.dart';
import 'package:productive/features/create/presentation/widgets/repeat.dart';
import 'package:productive/features/create/presentation/widgets/save_button.dart';
import 'package:productive/features/create/presentation/widgets/select_current_date_bottomsheet.dart';

import '../widgets/select_time_bottomsheet.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _currentTime;
  DateTime? _selectedTime;

  void _showTimePicker(BuildContext context) async {
    DateTime? selectedTime = await showSelectTimeBottomSheet(context);
    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(AppIcons.bold),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            context.localization.create_event,
            style: context.style.fontSize24Weight700,
          ),
        ),
        backgroundColor: context.colors.mainDark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(AppIcons.meet),
                        const SizedBox(height: 8),
                        Text(
                          context.localization.meet,
                          style: context.style.fontSize14Weight400,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(AppIcons.birthday),
                        const SizedBox(height: 8),
                        Text(
                          context.localization.birthday,
                          style: context.style.fontSize14Weight400,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(AppIcons.online),
                        const SizedBox(height: 8),
                        Text(
                          context.localization.online,
                          style: context.style.fontSize14Weight400,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(AppIcons.other),
                        const SizedBox(height: 8),
                        Text(
                          context.localization.other,
                          style: context.style.fontSize14Weight400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(27),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.backgroundColor,
                  border: Border.all(
                    color: context.colors.unactivatedColor,
                    width: 0.38,
                  ),
                ),
                child: TextField(
                  style: TextStyle(color: context.colors.whiteLabel),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                    hintText: context.localization.event_title,
                    hintStyle: context.style.fontSize18Weight500Grey,
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Gap(20),
              Divider(
                color: context.colors.whiteLabel.withOpacity(0.2),
                thickness: 0.5,
              ),
              const Gap(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localization.start_date,
                  style: context.style.fontSize16Weight500Blue,
                ),
              ),
              const Gap(12),
              Container(
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.backgroundColor,
                  border: Border.all(
                    color: context.colors.unactivatedColor,
                    width: 0.38,
                  ),
                ),
                child: TextField(
                  style: TextStyle(color: context.colors.whiteLabel),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16, 13, 0, 12),
                    hintText: _startDate != null
                        ? _startDate!.toString()
                        : context.localization.date,
                    hintStyle: context.style.fontSize14Weight400Grey,
                    border: InputBorder.none,
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        DateTime? selectedDate = await showSelectCurrentDateBottomSheet(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 13, 8, 13),
                        child: SvgPicture.asset(AppIcons.start),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localization.end_date,
                  style: context.style.fontSize16Weight500Blue,
                ),
              ),
              const Gap(12),
              Container(
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.backgroundColor,
                  border: Border.all(
                    color: context.colors.unactivatedColor,
                    width: 0.38,
                  ),
                ),
                child: TextField(
                  style: TextStyle(color: context.colors.whiteLabel),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16, 13, 0, 12),
                    hintText: _endDate != null
                        ? DateFormat('yyyy-MM-dd').format(_endDate!)
                        : context.localization.date,
                    hintStyle: context.style.fontSize14Weight400Grey,
                    border: InputBorder.none,
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        DateTime? selectedDate = await showSelectCurrentDateBottomSheet(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 13, 8, 13),
                        child: SvgPicture.asset(AppIcons.end),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(28),
              const Row(
                children: [
                  AllDayWidget(),
                  Gap(40),
                  RepeatWidget(),
                ],
              ),
              const Gap(20),
              Divider(
                color: context.colors.whiteLabel.withOpacity(0.2),
                thickness: 0.5,
              ),
              const Gap(20),
              Container(
                height: 147,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.backgroundColor,
                  border: Border.all(
                    color: context.colors.unactivatedColor,
                    width: 0.38,
                  ),
                ),
                child: TextField(
                  style: context.style.fontSize8Weight400
                      .copyWith(color: context.colors.whiteLabel),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                    hintText: context.localization.add_note,
                    hintStyle: context.style.fontSize14Weight500Grey,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SaveButton(),
      ),
    );
  }
}
