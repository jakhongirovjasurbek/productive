import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/presentation/widgets/task_item.dart';

import '../../../../tasks/presentation/bloc/task_bloc.dart';
import '../../pages/select_data_time.dart';

class TimeColumn extends StatelessWidget {
  final String title;
  final Timestamp time;
  final bool isStartDate;
  const TimeColumn({
    required this.title,
    required this.time,
    required this.isStartDate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final time = await selectTime(context);
          if (time != null) {
            time.copyWith(
                hour: time.hour,
                minute: time.minute
            );
          }
          isStartDate ?
          context.read<TaskBloc>().add(
            CreateStartDataTime(
                time: Timestamp.fromMillisecondsSinceEpoch(
                    time!.millisecondsSinceEpoch)),
          ) :
          context.read<TaskBloc>().add(
            CreateEndDataTime(
                time: Timestamp.fromMillisecondsSinceEpoch(
                    time!.millisecondsSinceEpoch)),
          );
        },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.style.fontSize16Weight500Blue,
        ),
        const Gap(7),
        Text(
          getProperTime(time),
          style: context.style.fontSize14Weight400Grey,
        ),
        const Gap(10),
        Container(
          height: 0.5,width: MediaQuery.sizeOf(context).width * 0.4,
          color: context.colors.white,
        )
      ],
    ),
    );
  }
}
