import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/icons.dart';

class MyBottomSheet extends StatefulWidget {
  final void Function(String) onSelected;

  const MyBottomSheet({Key? key, required this.onSelected}) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String? _selectedValue;

  final List<Map<String, dynamic>> rowData = [
    {"text": "Once", "value": "Once"},
    {"text": "Daily", "value": "Daily"},
    {"text": "Weekly", "value": "Weekly"},
    {"text": "Monthly", "value": "Monthly"},
    {"text": "Annually", "value": "Annually"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 359,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color: context.colors.loginTextFieldBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  if (_selectedValue != null) {
                    widget.onSelected(_selectedValue!);
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: SvgPicture.asset(context.icons.exit),
                ),
              ),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 295),
              child: Text(
                context.localization.repeat,
                style: context.style.fontSize20Weight300,
              ),
            ),
            Gap(16),
            Divider(
              color: context.colors.whiteLabel.withOpacity(0.2),
              thickness: 0.5,
            ),
            Gap(16.5),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: rowData.length,
              itemBuilder: (context, index) {
                final data = rowData[index];
                return Column(
                  children: [
                    _buildRow(data),
                    Gap(16.5),
                    Divider(
                      color: context.colors.whiteLabel.withOpacity(0.2),
                      thickness: 0.5,
                    ),
                    Gap(16.5),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedValue = data["value"];
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              data["text"],
              style: TextStyle(
                color: _selectedValue == data["value"]
                    ? context.colors.skipButtonColor
                    : context.colors.whiteLabel,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedValue == data["value"]
                      ? context.colors.skipButtonColor
                      : context.colors.innerAlignmentSecond,
                ),
                color: _selectedValue == data["value"]
                    ? context.colors.skipButtonColor
                    : Colors.transparent,
              ),
              child: _selectedValue == data["value"]
                  ? SvgPicture.asset(AppIcons.radio)
                  : null,
            ),
          ),

        ],
      ),
    );
  }
}