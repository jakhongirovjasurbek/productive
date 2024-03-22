import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/widgets/select_date_bottomsheet.dart';
import '../event_bloc/event_bloc.dart';

Future<DateTime?> showSelectCurrentDateBottomSheet(BuildContext context) async {
  return await showModalBottomSheet<DateTime?>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: BlocProvider.of<CreateEventBloc>(context),
        child: SelectCurrentDateBottomSheet(),
      );
    },
  );
}

class SelectCurrentDateBottomSheet extends StatefulWidget {
  @override
  State<SelectCurrentDateBottomSheet> createState() =>
      _SelectCurrentDateBottomSheetState();
}

class _SelectCurrentDateBottomSheetState
    extends State<SelectCurrentDateBottomSheet> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 250,
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
              DateFormat('dd/MM/yyyy').format(_startDate ?? DateTime.now()),
              style: context.style.fontSize20Weight500,
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: context.colors.whiteLabel.withOpacity(0.2),
            thickness: 0.5,
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              DateTime? selectedDate =
              await showSelectDateBottomSheet(context, _startDate as String?);
              if (selectedDate != null) {
                setState(() {
                  _startDate = selectedDate;
                });
              }
            },
            child: Text(
              context.localization.add_time,
              style: context.style.fontSize16Weight400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 275),
            child: Divider(
              color: context.colors.whiteLabel,
              thickness: 1,
            ),
          ),
          Spacer(),
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
                  Navigator.pop(context, _startDate ?? DateTime.now());
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
