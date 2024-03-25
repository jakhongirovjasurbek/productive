import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';
import '../../../../../assets/icons.dart';

Future<dynamic> selectIconTask(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: context.colors.bottomSheetBgColor,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: SvgPicture.asset(AppIcons.divider2),
                      ),
                      Gap(MediaQuery.of(context).size.width * 0.3),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          height: 24,
                          width: 24,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(AppIcons.selectIconBack),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    cursorColor: context.colors.cursorColor2,
                    decoration: InputDecoration(
                      hintText: context.localization.search_by_category,
                      hintStyle: context.style.fontSize14Weight400,
                      prefixIcon: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(AppIcons.searchTask),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: context.colors.white.withOpacity(0.2)),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<TaskBloc>().add(
                              SelectIconTask(index: index));
                        },
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: getColor(index),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.network(
                              getIcon(index),
                            ),
                          ),
                          title: Text(
                            getTitle(index),
                            style: context.style.fontSize20Weight500,
                          ),
                        ),
                      ),
                      Divider(color: context.colors.white.withOpacity(0.2)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}


String getIcon(int index) {
  switch (index) {
    case 0:
      return "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fbag.svg?alt=media&token=42d0cae5-7cc7-476c-9b98-0469071ff65b";
    case 1:
      return "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fstudy.svg?alt=media&token=bd2845b7-2354-4526-86fa-59c35def3761";
    case 2:
      return "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fsport.svg?alt=media&token=bb61931f-440f-4aa2-b830-75b0a4ea1134";
    case 3:
      return "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fmeet.svg?alt=media&token=21dd0713-8db0-4e36-87ca-4db87f2d6361";
    default:
      return "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Ftasks.svg?alt=media&token=cdc71083-9c06-4c45-8b41-8c010044bb84";
  }
}
String getTitle(int index) {
  switch (index) {
    case 0:
      return "Work";
    case 1:
      return "Study";
    case 2:
      return "Sport";
    case 3:
      return "Meet";
    default:
      return "Task";
  }
}

Color getColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFF525298);
    case 1:
      return const Color(0xFFDD8491);
    case 2:
      return const Color(0xFFFF8700);
    case 3:
      return const Color(0xFF22B07D);
    default:
      return const Color(0xFF4B7FD6);
  }
}
