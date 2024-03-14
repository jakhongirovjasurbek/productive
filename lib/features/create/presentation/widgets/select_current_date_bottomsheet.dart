import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/widgets/select_date_bottomsheet.dart';

Future<DateTime?> showSelectCurrentDateBottomSheet(BuildContext context) async {
  return showModalBottomSheet<DateTime?>(
    context: context,
    builder: (BuildContext context) {
      return SelectCurrentDateBottomSheet();
    },
  );
}

class SelectCurrentDateBottomSheet extends StatelessWidget {
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
              DateFormat('dd/MM/yyyy').format(DateTime.now()),
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
            onTap: () async{
             await showSelectDateBottomSheet(context,null);
              Navigator.pop(context, DateTime.now());
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
            padding: const EdgeInsets.symmetric(horizontal: 125),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: context.colors.skipButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, DateTime.now());
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
