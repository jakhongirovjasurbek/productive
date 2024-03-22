import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/event_bloc/event_bloc.dart';
import 'package:productive/features/create/presentation/widgets/all_day.dart';
import 'package:productive/features/create/presentation/widgets/repeat.dart';
import 'package:productive/features/create/presentation/widgets/save_button.dart';
import 'package:productive/features/create/presentation/widgets/select_current_date_bottomsheet.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateEventBloc(),
      child: _CreateEventPage(),
    );
  }
}

class _CreateEventPage extends StatefulWidget {
  @override
  State<_CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<_CreateEventPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  int index = -1;

  void _showTimePicker(BuildContext context, bool isStartDate) async {
    DateTime? selectedDate = await showSelectCurrentDateBottomSheet(context);
    if (selectedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = selectedDate;
          context.read<CreateEventBloc>().add(StartDateSelected(selectedDate));
        } else {
          _endDate = selectedDate;
          context.read<CreateEventBloc>().add(EndDateSelected(selectedDate));
        }
      });
    }
  }

  void _onIconTapped(int index) {
    context.read<CreateEventBloc>().add(TopicIconPressed(index));
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
                  children: List.generate(
                    4,
                    (i) => GestureDetector(
                      onTap: () => _onIconTapped(i),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: i == index
                                  ? context.colors.expensesGift
                                  : context.colors.skipButtonColor,
                            ),
                            height: 40,
                            width: 40,
                            child: Transform.scale(
                              scale: 0.65,
                              child: SvgPicture.asset(
                                _getIconAsset(i),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getIconText(context, i),
                            style: context.style.fontSize14Weight400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
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
              const SizedBox(height: 20),
              Divider(
                color: context.colors.whiteLabel.withOpacity(0.2),
                thickness: 0.5,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localization.start_date,
                  style: context.style.fontSize16Weight500Blue,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  _showTimePicker(context, true);
                },
                child: Container(
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
                    enabled: false,
                    style: TextStyle(color: context.colors.whiteLabel),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 13, 0, 12),
                      hintText: _startDate != null
                          ? '${DateFormat.yMMMMd().format(_startDate!)} ${_formatTime(_startDate!)}'
                          : context.localization.date,
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
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localization.end_date,
                  style: context.style.fontSize16Weight500Blue,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  _showTimePicker(context, false);
                },
                child: Container(
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
                    enabled: false,
                    style: TextStyle(color: context.colors.whiteLabel),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 13, 0, 12),
                      hintText: _endDate != null
                          ? '${DateFormat.yMMMMd().format(_endDate!)} ${_formatTime(_endDate!)}'
                          : context.localization.date,

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
              const SizedBox(height: 28),
              Row(
                children: [
                  AllDayWidget(),
                  const SizedBox(width: 40),
                  RepeatWidget(),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                color: context.colors.whiteLabel.withOpacity(0.2),
                thickness: 0.5,
              ),
              const SizedBox(height: 20),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SaveButton(),
      ),
    );
  }

  String _getIconAsset(int index) {
    switch (index) {
      case 0:
        return AppIcons.communication;
      case 1:
        return AppIcons.birthday;
      case 2:
        return AppIcons.meeting;
      case 3:
        return AppIcons.starEvent;
      default:
        return '';
    }
  }

  String _getIconText(BuildContext context, int index) {
    switch (index) {
      case 0:
        return context.localization.meet;
      case 1:
        return context.localization.birthday;
      case 2:
        return context.localization.online;
      case 3:
        return context.localization.other;
      default:
        return '';
    }
  }
  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }
}
