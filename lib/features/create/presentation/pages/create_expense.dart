import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';
import 'package:productive/features/create/presentation/widgets/select_color_expense.dart';

import '../../../../assets/icons.dart';
import '../widgets/expense_bottom_sheet.dart';

class CreateExpanse extends StatefulWidget {
  const CreateExpanse({super.key});

  @override
  State<CreateExpanse> createState() => _CreateExpanseState();
}

class _CreateExpanseState extends State<CreateExpanse> {
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
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
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
                    },
                    child: SvgPicture.asset(
                      AppIcons.backPage,
                    )),
              ),
              title: Text(
                context.localization.create_expense,
                style: context.style.fontSize24Weight700,
              )),
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
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: colors[state.colorIndex],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  selectIcon(context);
                                },
                                child: SvgPicture.asset(
                                  state.selectIcon,
                                ),
                              ),
                            ),
                            const Gap(20),
                            Expanded(
                              child: TextField(
                                style:
                                    context.style.fontSize16Weight500.copyWith(
                                  color: context.colors.whiteLabel,
                                ),
                                controller: titleController,
                                // cursorColor: ,
                                decoration: InputDecoration(
                                  hintText: context.localization.new_title,
                                  hintStyle: context.style.fontSize14Weight500
                                      .copyWith(
                                          color: context.colors.createTaskTime),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(18),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          style: context.style.fontSize16Weight500.copyWith(
                            color: context.colors.timeContainerOne,
                          ),
                          controller: usdController,
                          decoration: InputDecoration(
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  context.localization.usd,
                                  style: context.style.fontSize14Weight500
                                      .copyWith(
                                          color: context.colors.tasksTimeColor),
                                ),
                              ],
                            ),
                            filled: true,
                            fillColor: context.colors.inpBackgroundColor,
                            hintText: context.localization.zero,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintStyle:
                                context.style.fontSize16Weight500.copyWith(
                              color: context.colors.notificationsClear,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            // focusColor: Colors.red
                          ),
                        ),
                      ),
                      const Gap(18),
                      TextField(
                        maxLines: 5,
                        autofocus: false,
                        style: TextStyle(
                            color: context.colors.whiteLabel,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        controller: noteController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: context.colors.inpBackgroundColor,
                          hintText: context.localization.add_note,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          hintStyle: context.style.fontSize14Weight500.copyWith(
                            color: context.colors.createTaskTime,
                          ),
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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.addButtonLinear1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                context.read<ExpenseBloc>().add(CreateNewExpense(
                      colorIndex: state.colorIndex,
                      description: noteController.text,
                      price: double.parse(usdController.text),
                      title: titleController.text,
                      icon: state.selectIcon,
                      onSuccess: () {
                        print('expense created');
                      },
                      onFailure: (errorMassage) {
                        ScaffoldMessenger.of(context).showMaterialBanner(
                          MaterialBanner(
                            onVisible: () async {
                              await Future.delayed(const Duration(seconds: 3));
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
                    ));
              },
              child: Text(context.localization.save),
            ),
          ),
        );
      },
    );
  }
}
