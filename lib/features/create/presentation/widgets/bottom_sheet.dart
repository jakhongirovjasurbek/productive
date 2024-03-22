import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../../../../assets/icons.dart';
import '../event_bloc/event_bloc.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rowData = [
      {"text": "Once", "value": "Once"},
      {"text": "Daily", "value": "Daily"},
      {"text": "Weekly", "value": "Weekly"},
      {"text": "Monthly", "value": "Monthly"},
      {"text": "Annually", "value": "Annually"},
    ];

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
                  Navigator.pop(context);
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
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<CreateEventBloc>(context).add(
                      RepeatTimeChanged(data["value"]),
                    );
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      _buildRow(context, data),
                      Gap(16.5),
                      Divider(
                        color: context.colors.whiteLabel.withOpacity(0.2),
                        thickness: 0.5,
                      ),
                      Gap(16.5),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, Map<String, dynamic> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            data["text"],
            style: TextStyle(
              color: context.colors.whiteLabel,
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
                color: context.colors.innerAlignmentSecond,
              ),
            ),
            child: BlocBuilder<CreateEventBloc, CreateEventState>(
              builder: (context, state) {
                return state.repeatTime == data["value"]
                    ? SvgPicture.asset(AppIcons.radio)
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
      ],
    );
  }
}
