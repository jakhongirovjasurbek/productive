import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/presentation/bloc/notification_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Notifications();
  }
}

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
            BlocBuilder<NotificationBloc, NotificationInitial>(
              builder: (context, state) {
                return state.data.isNotEmpty?Text(
                  context.localization.clear,
                  style: context.style.fontSize14Weight500,
                ):const Text("");
              },
            ),
          ],
        ),
        body: Builder(builder: (context) {
          return BlocBuilder<NotificationBloc, NotificationInitial>(
              builder: (_, state) {
            if (state.status == NotificationStatus.success) {
              return ListView.builder(
                itemBuilder: (_, index) {
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
                                horizontal: MediaQuery.of(context).size.width *
                                    0.042666),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  state.data[index].title,
                                  style: context.style.fontSize16Weight700,
                                ),
                                SizedBox(
                                  height: (4 / 919) *
                                      MediaQuery.of(context).size.height,
                                ),
                                Text(
                                  state.data[index].subTitle,
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
                itemCount: state.data.length,
              );
            } else if (state.status == NotificationStatus.pure) {
              context.read<NotificationBloc>().add(GetNotifications());
              return const SizedBox();
            } else if (state.status == NotificationStatus.loading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.status == NotificationStatus.empty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 270,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.noNotification),
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
            return Center(
              child: Text(
                context.localization.failure,
                style: context.style.fontSize24Weight600,
              ),
            );
          });
        }),
      );
    });
  }
}
