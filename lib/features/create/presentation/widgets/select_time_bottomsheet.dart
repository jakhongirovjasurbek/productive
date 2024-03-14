import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';

Future<DateTime?> showSelectTimeBottomSheet(BuildContext context) async {
  return showModalBottomSheet<DateTime?>(
    context: context,
    builder: (BuildContext context) {
      return SelectTimeBottomSheet();
    },
  );
}

class SelectTimeBottomSheet extends StatefulWidget {
  final DateTime? initialTime;

  const SelectTimeBottomSheet({Key? key, this.initialTime}) : super(key: key);

  @override
  _SelectTimeBottomSheetState createState() => _SelectTimeBottomSheetState();
}

class _SelectTimeBottomSheetState extends State<SelectTimeBottomSheet> {
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 368,
      height: 375,
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
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              DateFormat('dd/MM/yyyy').format(DateTime.now()),
              style: context.style.fontSize20Weight500,
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: context.colors.whiteLabel.withOpacity(0.2),
            thickness: 0.5,
          ),
          SizedBox(height: 16),
          Expanded(
            child: CupertinoDatePicker(
              initialDateTime: widget.initialTime ?? DateTime.now(),
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  _selectedTime = DateTime(
                    widget.initialTime!.year,
                    widget.initialTime!.month,
                    widget.initialTime!.day,
                    newDateTime.hour,
                    newDateTime.minute,
                  );
                });
              },
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              context.localization.remove_time,
              style: context.style.fontSize16Weight400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 265),
            child: Divider(
              color: context.colors.whiteLabel,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 125),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: context.colors.skipButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {

                  Navigator.pop(context, _selectedTime);
                },
                child: Text(context.localization.confirm),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showTimePicker() async {
    DateTime? selectedTime = await showSelectTimeBottomSheet(context);
    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }
}
