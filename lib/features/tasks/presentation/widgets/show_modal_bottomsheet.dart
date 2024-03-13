import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/create/presentation/widgets/container_icon.dart';

import '../create_screen.dart';

Future<dynamic> modalButtom(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ContainerIcon(
                      color: context.colors.addButtonLinear1,
                    ),
                    SvgPicture.asset(context.icons.moneyCreate),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ContainerIcon(
                      color: context.colors.addButtonLinear1,
                    ),
                    SvgPicture.asset(context.icons.moneyCreate),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ContainerIcon(
                      color: context.colors.addButtonLinear1,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (_) => const CreateScreen(),
                          ),
                        );
                      },
                      child: SvgPicture.asset(context.icons.tasksCreate),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ContainerIcon(
                      color: context.colors.addButtonLinear1,
                    ),
                    SvgPicture.asset(context.icons.notesCreate),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ContainerIcon(color: context.colors.addButtonLinear1),
                    SvgPicture.asset(context.icons.eventCreate),
                  ],
                ),
              ],
            ),
            const Gap(26),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                   radius: 14,
                    backgroundColor: context.colors.whiteLabel,
                    child: SvgPicture.asset(context.icons.x, color: context.colors.expensesBackground,),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 28,
            )
          ],
        ),
      );
    },
  );
}
