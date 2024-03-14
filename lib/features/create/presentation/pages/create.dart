import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/pages/create_screen.dart';

class CreateItems extends StatefulWidget {
  const CreateItems({super.key});

  @override
  State<CreateItems> createState() => _CreateItemsState();
}

class _CreateItemsState extends State<CreateItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.colors.createhomeitem,
                              child: SvgPicture.asset(context.icons.money),
                            ),
                            const Gap(8),
                            Text(
                              context.localization.income,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.createhomeitemwhite,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.colors.createhomeitem,
                              child: SvgPicture.asset(AppIcons.expense),
                            ),
                            const Gap(8),
                            Text(
                              context.localization.expense,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.createhomeitemwhite,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.colors.createhomeitem,
                              child: SvgPicture.asset(context.icons.taskhome),
                            ),
                            const Gap(8),
                            Text(
                              context.localization.tasks,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.createhomeitemwhite,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Gap(61),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.colors.createhomeitem,
                              child: SvgPicture.asset(context.icons.note),
                            ),
                            const Gap(8),
                            Text(
                              context.localization.notes,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.createhomeitemwhite,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                context.colors.createhomeitem.withOpacity(0.0),
                          ),
                          const Gap(8),
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 14,
                                color: context.colors.createhomeitemwhite,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.colors.createhomeitem,
                              child: SvgPicture.asset(
                                context.icons.taskstar,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              context.localization.event,

                              // context.style.fontSize14Weight400.copyWith(
                              //   color: context.colors.createhomeitemwhite,
                              // )
                              style: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.createhomeitemwhite,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: SvgPicture.asset(context.icons.closecreate),
                  ),
                ],
              ),
              const Gap(28),
            ],
          ),
        ),
      ),
    );
  }
}
