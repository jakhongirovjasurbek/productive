import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/pages/select_icon.dart';

import '../../../../assets/icons.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  late final TextEditingController titleController;
  late final TextEditingController noteController;
  late final TextEditingController usdController;

  @override
  void initState() {
    titleController = TextEditingController();
    noteController = TextEditingController();
    usdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().mainDark,
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
              child: SvgPicture.asset(
                AppIcons.backPage,
              )),
        ),
        title: Text(
          context.localization.new_category,
          style: context.style.fontSize24Weight700.copyWith(
            color: context.colors.whiteLabel,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: context.style.fontSize16Weight500.copyWith(
                              color: context.colors.whiteLabel,
                            ),
                            controller: titleController,
                            // cursorColor: ,
                            decoration: InputDecoration(
                              hintText: context.localization.new_title,
                              hintStyle:
                              context.style.fontSize14Weight500.copyWith(
                                color: context.colors.createTaskTime,
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const NewSelectIcon(),
                              ));
                            },
                            child: SvgPicture.asset(AppIcons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(18),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      autofocus: false,
                      style: context.style.fontSize16Weight500.copyWith(color: context.colors.notificationsClear, ),
                      controller: usdController,
                      decoration: InputDecoration(
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.localization.usd,
                              style: context.style.fontSize14Weight500.copyWith(color: context.colors.whiteLabel, ),
                            ),
                          ],
                        ),
                        filled: true,
                        fillColor: context.colors.inpBackgroundColor,
                        hintText: context.localization.zero,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        hintStyle: context.style.fontSize16Weight500.copyWith(color: context.colors.notificationsClear, ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        // focusColor: Colors.red
                      ),
                    ),
                  ),
                  const Gap(18),
                  TextField(
                    maxLines: 5,
                    autofocus: false,
                    style: context.style.fontSize14Weight500.copyWith(color: context.colors.whiteLabel, ),
                    controller: usdController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.colors.inpBackgroundColor,
                      hintText: context.localization.add_note,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      hintStyle: context.style.fontSize14Weight500.copyWith(color: context.colors.createTaskTime, ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      // focusColor: Colors.red
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
