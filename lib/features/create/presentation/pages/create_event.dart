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

import '../widgets/select_icon_events.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
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
  late CreateEventBloc _createEventBloc;
  DateTime? _startDate;
  DateTime? _endDate;
  int index = -1;

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _createEventBloc = BlocProvider.of<CreateEventBloc>(context);
  }
  void _saveEventToFirestore() async {
    String title = titleController.text.trim();
    String note = noteController.text.trim();
  }
  void _showTimePicker(BuildContext context, bool isStartDate) async {
    DateTime? selectedDate = await showSelectCurrentDateBottomSheet(context);
    if (selectedDate != null) {
      if (isStartDate) {
        _startDate = selectedDate;
        _createEventBloc.add(StartDateSelected(selectedDate));
      } else {
        _endDate = selectedDate;
        _createEventBloc.add(EndDateSelected(selectedDate));
      }
    }
  }

  void _onIconTapped(int index) {
    _createEventBloc.add(TopicIconPressed(index));
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
          child: BlocBuilder<CreateEventBloc, CreateEventState>(
            builder: (context, state) {
              index = state.selectedIconIndex;
              return Column(
                children: [
                  IconSelectionWidget(onIconTapped: _onIconTapped, selectedIndex: index,),
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
                      controller: titleController,
                      style: TextStyle(color: context.colors.whiteLabel),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(16, 12, 0, 12),
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
                      controller: noteController,
                      style: context.style.fontSize8Weight400
                          .copyWith(color: context.colors.whiteLabel),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(16, 12, 0, 12),
                        hintText: context.localization.add_note,
                        hintStyle: context.style.fontSize14Weight500Grey,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CreateEventBloc, CreateEventState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                // context.read<CreateEventBloc>().add(SaveButtonPressed());
                context.read<CreateEventBloc>().add(SaveButtonPressed(
                  selectedIconIndex: state.selectedIconIndex,
                  startDate: state.startDate,
                  startTime: state.startTime,
                  endDate: state.endDate,
                  endTime: state.endTime,
                  isAllDay: state.isAllDay,
                  repeatTime: state.repeatTime,
                  eventTitle: titleController.text,
                  addNote: noteController.text,
                  onSuccess: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Event successfully created'),
                      ),
                    );
                  },
                  onFailure: (errorMassage) {
                    const SnackBar(
                      content: Text('Unknown error occurred'),
                    );
                  },
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.skipButtonColor,
                ),
                height: 40,
                width: 380,
                child: Center(
                  child: Text(
                    context.localization.save,
                    style: context.style.fontSize16Weight500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {

    return DateFormat('hh:mm a').format(dateTime);
  }
}
