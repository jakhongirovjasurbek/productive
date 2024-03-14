import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:productive/core/extensions/extensions.dart';

import 'package:productive/features/create/presentation/pages/home.dart';
import 'package:productive/features/create/presentation/pages/map_screen.dart';
import 'package:productive/features/create/presentation/pages/select_data_time.dart';
import 'package:productive/features/create/presentation/pages/select_icon_bottom_sheet.dart';

import '../../data/models/priority.dart';
import '../bloc/task_bloc.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late final TextEditingController controllerTile;
  late final TextEditingController noteController;
  DateTime? dateStartTime;
  DateTime? dataEndTime;
  int? priorityIndex;

  @override
  void initState() {
    controllerTile = TextEditingController();
    noteController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(context.icons.arrowBack),
              ),
            ),
            title: Text(context.localization.create_task,
                style: context.style.fontSize24Weight700),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.571),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: state.selectIconcolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              selectIcon(context);
                            },
                            child: SvgPicture.asset(state.selectIcon),
                          ),
                        ),
                        const Gap(18),
                        Expanded(
                          child: TextField(
                            style: context.style.fontSize18Weight600,
                            controller: controllerTile,
                            cursorColor: context.colors.buttonDisabledColor,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.whiteLabel
                                      .withOpacity(0.2),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.whiteLabel
                                      .withOpacity(0.2),
                                ),
                              ),
                              hintText: context.localization.new_title,
                              hintStyle: context.style.fontSize18Weight500
                                  .copyWith(
                                      color: context.colors.createTaskTime),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final time = await selectTime(context);
                          if (time != null) {
                            dateStartTime = time.copyWith(
                                hour: time.hour, minute: time.minute);
                          }
                          // ignore: use_build_context_synchronously
                          context.read<TaskBloc>().add(
                                CreateStartDataTime(time: dateStartTime!),
                              );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.localization.start,
                              style: context.style.fontSize16Weight500.copyWith(
                                color: context.colors.addButtonLinear1,
                              ),
                            ),
                            const Gap(7),
                            Text(
                              getProperTime(state.startDate, state.startDate),
                              style: context.style.fontSize14Weight400grey
                                  .copyWith(
                                color: context.colors.createTaskTime,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 0.5,
                              width: 153,
                              color: context.colors.whiteLabel.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final time = await selectTime(context);
                          if (time != null) {
                            dataEndTime = time.copyWith(
                                hour: time.hour, minute: time.minute);
                          }
                          // ignore: use_build_context_synchronously
                          context.read<TaskBloc>().add(
                                CreateEndDataTime(time: dataEndTime!),
                              );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.localization.end,
                              style: context.style.fontSize16Weight500.copyWith(
                                color: context.colors.buttonDisabledColor,
                              ),
                            ),
                            const Gap(7),
                            Text(
                              getProperTime(state.endDate, state.endDate),
                              style: context.style.fontSize14Weight400grey
                                  .copyWith(
                                color: context.colors.createTaskTime,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 0.5,
                              width: 153,
                              color: context.colors.whiteLabel.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(34),
                  Text(
                    context.localization.priority,
                    style: context.style.fontSize16Weight500.copyWith(
                      color: context.colors.buttonDisabledColor,
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            priorityIndex = index;
                            context.read<TaskBloc>().add(
                                  SelectPriorityColor(
                                      index: index, context: context),
                                );
                          },
                          child: Container(
                            width: 90,
                            height: 35,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: getColorPrioriyt(index, context) ==
                                      state.priorityColor
                                  ? state.priorityColor
                                  : null,
                              border: Border.all(
                                color: getColorPrioriyt(index, context),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              getTextPriority(index),
                              style: context.style.fontSize12Weight500
                                  .copyWith(color: context.colors.whiteLabel),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: noteController,
                    cursorColor: context.colors.buttonDisabledColor,
                    style: context.style.fontSize18Weight600,
                    decoration: InputDecoration(
                      fillColor: context.colors.inpBackgroundColor,
                      hintText: context.localization.add_note,
                      hintStyle: context.style.fontSize14Weight500.copyWith(
                        color: context.colors.createTaskTime,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.colors.inpBackgroundColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.colors.inpBackgroundColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: context.colors.inpBackgroundColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                  builder: (_) => const MapScreen()),
                              (route) => false);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(context.icons.location),
                        ),
                      ),
                      const Gap(11),
                      Text(
                        context.localization.add_location,
                        style: context.style.fontSize14Weight400grey.copyWith(
                          color: context.colors.createTaskTime,
                        ),
                      ),
                    ],
                  ),
                  const Gap(19),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          /* modalButtom(context); */
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(context.icons.notification),
                        ),
                      ),
                      const Gap(11),
                      Text(
                        context.localization.add_notification,
                        style: context.style.fontSize14Weight400grey.copyWith(
                          color: context.colors.createTaskTime,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.buttonDisabledColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (state.selectIcon == context.icons.tasksCreate) {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      onVisible: () async {
                        await Future.delayed(const Duration(seconds: 3));
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      content: Text(context.localization.select_icon),
                      actions: const [SizedBox()],
                    ),
                  );
                  return;
                }
                if (controllerTile.text.length < 3) {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      onVisible: () async {
                        await Future.delayed(const Duration(seconds: 3));
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      content: Text(context.localization.select_title),
                      actions: const [SizedBox()],
                    ),
                  );
                  return;
                }
                if (dateStartTime == null || dataEndTime == null) {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      onVisible: () async {
                        await Future.delayed(const Duration(seconds: 3));
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      content: Text(context.localization.select_time),
                      actions: const [SizedBox()],
                    ),
                  );
                  return;
                }
                if (priorityIndex == null) {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      onVisible: () async {
                        await Future.delayed(const Duration(seconds: 3));
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      content: Text(context.localization.select_priority),
                      actions: const [SizedBox()],
                    ),
                  );
                  return;
                }

                context.read<TaskBloc>().add(
                      CreateNewTaskButtonPressed(
                        note: noteController.text,
                        title: controllerTile.text,
                        icon: state.selectIcon,
                        priority: getPrioriyt(priorityIndex!),
                        startDate: dateStartTime!,
                        dueDate: dataEndTime!,
                        iconColor: state.selectIconcolor,
                        onSuccess: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        onFailure: (errorMassage) {
                          ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                              onVisible: () async {
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner();
                              },
                              content: Text(errorMassage),
                              actions: const [
                                SizedBox(),
                              ],
                            ),
                          );
                        },
                      ),
                    );

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomePageScreen()));
              },
              child: Text(
                context.localization.save,
                style: context.style.fontSize16Weight500
                    .copyWith(color: context.colors.whiteLabel),
              ),
            ),
          ),
        );
      },
    );
  }

  Priority getPrioriyt(int index) {
    switch (index) {
      case 0:
        return Priority.high;
      case 1:
        return Priority.medium;

      default:
        return Priority.low;
    }
  }

  String getTextPriority(int index) {
    switch (index) {
      case 0:
        return context.localization.high;
      case 1:
        return context.localization.medium;
      case 2:
        return context.localization.low;
      default:
        return "";
    }
  }

  Color getColorPrioriyt(int index, BuildContext context) {
    switch (index) {
      case 0:
        return context.colors.notificationsClear;
      case 1:
        return context.colors.expensesTransport;
      default:
        return context.colors.expensesGreen;
    }
  }

  @override
  void dispose() {
    controllerTile.dispose();
    noteController.dispose();
    super.dispose();
  }

  String getProperTime(DateTime date, DateTime minut) {
    if (date.hour > 12) {
      final soat = date.hour >= 12 ? date.hour - 12 : date.hour;
      final hour = soat < 10 ? '0$soat' : '$soat';
      final minute = minut.minute < 10 ? '0${minut.minute}' : '${minut.minute}';

      return "$hour:$minute PM";
    } else {
      final soat = date.hour >= 12 ? date.hour - 12 : date.hour;
      final hour = soat < 10 ? '0$soat' : '$soat';
      final minute = minut.minute < 10 ? '0${minut.minute}' : '${minut.minute}';

      return "$hour:$minute AM";
    }
  }
}
