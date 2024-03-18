import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';

class CreateItems extends StatefulWidget {
  const CreateItems({super.key});

  @override
  State<CreateItems> createState() => _CreateItemsState();
}

class _CreateItemsState extends State<CreateItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          DefaultTextStyle(
                            style: const TextStyle(
                                decoration: TextDecoration.none),
                            child: Text(
                              context.localization.income,
                              style: context.style.fontSize14Weight500.copyWith(
                                color: context.colors.createhomeitemwhite,
                              ),
                            ),
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
                          DefaultTextStyle(
                            style: const TextStyle(
                                decoration: TextDecoration.none),
                            child: Text(context.localization.expense,
                                style:
                                    context.style.fontSize14Weight500.copyWith(
                                  color: context.colors.createhomeitemwhite,
                                )),
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
                          DefaultTextStyle(
                            style: const TextStyle(
                                decoration: TextDecoration.none),
                            child: Text(context.localization.tasks,
                                style:
                                    context.style.fontSize14Weight500.copyWith(
                                  color: context.colors.createhomeitemwhite,
                                )),
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
                          DefaultTextStyle(
                            style: const TextStyle(
                                decoration: TextDecoration.none),
                            child: Text(context.localization.notes,
                                style:
                                    context.style.fontSize14Weight500.copyWith(
                                  color: context.colors.createhomeitemwhite,
                                )),
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
                        Text("",
                            style: context.style.fontSize14Weight500.copyWith(
                              color: context.colors.createhomeitemwhite,
                            )),
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
                          DefaultTextStyle(
                            style: const TextStyle(
                                decoration: TextDecoration.none),
                            child: Text(context.localization.event,
                                style:
                                    context.style.fontSize14Weight500.copyWith(
                                  color: context.colors.createhomeitemwhite,
                                )),
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
                  onTap: () {},
                  child: SvgPicture.asset(context.icons.closecreate),
                ),
              ],
            ),
            const Gap(28),
          ],
        ),
      ),
    );
  }
}
