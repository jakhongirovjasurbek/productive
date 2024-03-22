import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/widgets/select_time_bottomsheet.dart';
import '../event_bloc/event_bloc.dart';

Future<DateTime?> showSelectDateBottomSheet(
    BuildContext context, String? selectedTimeText) async {
  return showModalBottomSheet<DateTime?>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: BlocProvider.of<CreateEventBloc>(context),
        child: SelectDateBottomSheet(selectedTimeText: selectedTimeText),
      );
    },
  );
}

class SelectDateBottomSheet extends StatefulWidget {
  final DateTime? initialDate;
  final String? selectedTimeText;

  const SelectDateBottomSheet({
    Key? key,
    this.initialDate,
    this.selectedTimeText,
  }) : super(key: key);

  @override
  _SelectDateBottomSheetState createState() => _SelectDateBottomSheetState();
}

class _SelectDateBottomSheetState extends State<SelectDateBottomSheet> {
  DateTime? _selectedDate;
  String? _selectedTimeText;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    if (widget.initialDate != null) {
      _dateController.text =
          DateFormat('yyyy-MM-dd').format(widget.initialDate!);
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 368,
      decoration: BoxDecoration(
        color: context.colors.loginTextFieldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  context.icons.exit,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: CupertinoDatePicker(
              itemExtent: 50,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: widget.initialDate ?? DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  _selectedDate = newDateTime;
                  _dateController.text =
                      DateFormat('dd-MM-yyyy').format(newDateTime);
                });
              },
            ),
          ),
          Divider(
            color: context.colors.whiteLabel.withOpacity(0.2),
            thickness: 0.5,
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              DateTime? selectedTime = await showSelectTimeBottomSheet(context);
              if (selectedTime != null) {
                setState(() {
                  _selectedTimeText = DateFormat('HH:mm').format(selectedTime);
                });
              }
            },
            child: Text(
              _selectedTimeText ?? widget.selectedTimeText ?? context.localization.add_time,
              style: context.style.fontSize16Weight400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 285),
            child: Divider(
              color: context.colors.whiteLabel,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 127),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: context.colors.skipButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, _selectedDate);
                },
                child: Text(context.localization.confirm),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
