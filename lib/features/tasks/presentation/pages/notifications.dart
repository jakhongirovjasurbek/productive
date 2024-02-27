import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Random random = Random();
  final title = [
    'Distinctive New Settings',
    'Congratulations!',
    'You missed the task..',
    'Congratulations!',
    'Distinctive New Settings',
    'Invest your time',
    'Card activated',
  ];
  final subTitle = [
    'Learn about the new settings in the app that we have added ',
    'Your Premium version subscription has been successfully renewed',
    'You missed a task that you did not complete',
    'Your Premium version subscription has been successfully renewed',
    'Learn about the new settings in the app that we have added ',
    'Time is the most precious thing a person can invest..',
    'You missed a task that you did not complete',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.mainDark,
        elevation: 1,
        title: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: context.colors.white,
          onPressed: () {
            // Navigator.pushReplacementNamed(context, AppRouteNames.emptyNotification);
          },
        ),
        actions: [
          Text(
            context.localization.notification,
            style: context.style.fontSize24Weight700,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.24,
          ),
          Text(
            context.localization.clear,
            style: context.style.fontSize14Weight500,
          ),
        ],
      ),
      body: title.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.042666,
                          vertical:
                              MediaQuery.of(context).size.height * 0.0239),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.099,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: context.colors.loginTextFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.042666),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                title[index],
                                style: context.style.fontSize16Weight700,
                              ),
                              SizedBox(
                                height: (4 / 919) *
                                    MediaQuery.of(context).size.height,
                              ),
                              Text(
                                subTitle[index],
                                style: context.style.fontSize12Weight500,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "23 September, 2022",
                                    style: context.style.fontSize8Weight400,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: MediaQuery.of(context).size.height * 0.0095,
                      child: SvgPicture.asset(
                        AppIcons.delete,
                      ),
                    ),
                  ],
                );
              },
              itemCount: 7,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 270,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo/no_notifi.png"),
                      Text(
                        context.localization.no_notifications,
                        style: context.style.fontSize20Weight500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
