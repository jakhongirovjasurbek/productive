import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../event_bloc/event_bloc.dart';

class AllDayWidget extends StatelessWidget {
  const AllDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.backgroundColor,
                ),
                height: 42,
                width: 126,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 11, 0, 12),
                      child: Text(
                        context.localization.all_day,
                        style: context.style.fontSize16Weight500Blue,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        trackOutlineColor: MaterialStateProperty.all<Color>(
                            context.colors.switchColor),
                        inactiveTrackColor: context.colors.switchColor,
                        inactiveThumbColor: context.colors.white,
                        activeTrackColor: context.colors.skipButtonColor,
                        activeColor: context.colors.white,

                        value: state.isAllDay,
                        onChanged: (newValue) {
                          BlocProvider.of<CreateEventBloc>(context)
                              .add(AllDayButtonPressed());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
