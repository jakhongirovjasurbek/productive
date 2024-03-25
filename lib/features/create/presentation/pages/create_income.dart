import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/mixin/create_income_mixin.dart';
import 'package:productive/core/widgets/w_button.dart';
import 'package:productive/core/widgets/w_textfield.dart';
import 'package:productive/features/create/data/model/income_active_status.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_income/income_bloc.dart';
import 'package:productive/features/create/presentation/widgets/show_snackbar.dart';

class CreateIncomeScreen extends StatefulWidget {
  const CreateIncomeScreen({super.key});

  @override
  State<CreateIncomeScreen> createState() => _CreateIncomeScreenState();
}

class _CreateIncomeScreenState extends State<CreateIncomeScreen>
    with CreateIncomeMixin {
  @override
  void initState() {
    titleController.addListener(() {
      context.read<IncomeBloc>().add(
            EditDisablding(
              title: titleController.text,
              usd: usd,
              note: noteController.text,
            ),
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeBloc, IncomeState>(
      builder: (context, state) {
        switch (state.activeStatus) {
          case IncomeActiveStatus.success:
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    context.localization.create_income,
                    style: context.style.fontSize24Weight700,
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 17),
                      child: SvgPicture.network(context.icons.arrow),
                    ),
                  ),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showBottomSheetWidget(
                                context,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: getColor(state.priority),
                              ),
                              padding: const EdgeInsets.all(9),
                              child: SvgPicture.network(
                                getSvg(state.priority),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                WTextField(
                                  textInputAction: TextInputAction.next,
                                  autoFocus:
                                      titleController.text == "" ? true : false,
                                  fillColor: Colors.transparent,
                                  hasBorderColor: false,
                                  borderRadius: 0,
                                  cursorHeight: 27,
                                  cursorColor: context.colors.createTaskTime,
                                  focusNode: FocusNode(),
                                  hintText: context.localization.new_title,
                                  hintTextStyle: context
                                      .style.fontSize18Weight500
                                      .copyWith(
                                    color: context.colors.createTaskTime,
                                  ),
                                  textStyle: context.style.fontSize18Weight500
                                      .copyWith(
                                    color: context.colors.createTaskTime,
                                  ),
                                  controller: titleController,
                                  keyBoardType: TextInputType.text,
                                  maxlines: 1,
                                ),
                                Divider(
                                  color:
                                      context.colors.createIncomeInputLineColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Gap(31.5),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: context.colors.btnBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.inpBackgroundColor,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: context.colors.btnSecondColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                        width: 0.5,
                                        color: context.colors.btnBorderColor)),
                                child: Text(
                                  context.localization.usd,
                                  style: context.style.fontSize14Weight500,
                                ),
                              ),
                            ),
                            Expanded(
                              child: WTextField(
                                textInputAction: TextInputAction.next,
                                hasBorderColor: false,
                                focusNode: FocusNode(),
                                onChanged: (value) {
                                  value != "" ? (usd = int.parse(value)) : null;
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8),
                                hintText: "0.00",
                                hintTextStyle: context.style.fontSize16Weight500
                                    .copyWith(
                                        color:
                                            context.colors.isCheckGreenColor),
                                keyBoardType: TextInputType.number,
                                textStyle: context.style.fontSize16Weight500
                                    .copyWith(
                                        color:
                                            context.colors.isCheckGreenColor),
                                cursorColor: context.colors.createTaskTime,
                              ),
                            ),
                            const Gap(16),
                          ],
                        ),
                      ),
                      const Gap(18),
                      WTextField(
                        onEditCompleted: () {
                          context.read<IncomeBloc>().add(
                                AddIncome(
                                  priority: state.priority,
                                  title: titleController.text,
                                  usd: usd,
                                  note: noteController.text,
                                  iconUrl: getSvg(state.priority),
                                ),
                              );
                          titleController.text = "";
                          noteController.text = "";
                          usd = 0;
                        },
                        textInputAction: TextInputAction.done,
                        controller: noteController,
                        minLines: 7,
                        maxlines: 7,
                        hasBorderColor: false,
                        keyBoardType: TextInputType.text,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        borderRadius: 8,
                        fillColor: context.colors.expensesBackground,
                        cursorColor: context.colors.createTaskTime,
                        hintText: context.localization.add_note,
                        hintTextStyle:
                            context.style.fontSize14Weight500.copyWith(
                          color: context.colors.createTaskTime,
                        ),
                        textStyle: context.style.fontSize14Weight500.copyWith(
                          color: context.colors.createTaskTime,
                        ),
                      ),
                      const Spacer(),
                      WButton(
                        disabled: state.isDisabled,
                        borderRadius: 8,
                        height: MediaQuery.sizeOf(context).height / 100 * 6,
                        onTap: () {
                          context.read<IncomeBloc>().add(
                                AddIncome(
                                  priority: state.priority,
                                  title: titleController.text,
                                  usd: usd,
                                  note: noteController.text,
                                  iconUrl: getSvg(state.priority),
                                ),
                              );
                          titleController.text = "";
                          noteController.text = "";
                          usd = 0;
                        },
                        child: Text(
                          context.localization.save,
                          style: context.style.fontSize16Weight500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          case IncomeActiveStatus.loading:
            return const Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
