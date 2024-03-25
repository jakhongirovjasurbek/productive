import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../../../../assets/icons.dart';
import '../event_bloc/event_bloc.dart';
import 'bottom_sheet.dart';

class RepeatWidget extends StatelessWidget {
  const RepeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.backgroundColor,
        ),
        height: 42,
        width: 194,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 11, 15, 12),
              child: Text(
                context.localization.repeat,
                style: context.style.fontSize16Weight500Blue,
              ),
            ),
            const SizedBox(width: 24),
            BlocBuilder<CreateEventBloc, CreateEventState>(
              builder: (context, state) {
                return Text(
                  state.repeatTime,
                  style: context.style.fontSize16Weight500Grey,
                );
              },
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(AppIcons.down),
          ],
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet();
      },
    );
  }
}
