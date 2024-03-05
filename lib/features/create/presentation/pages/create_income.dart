import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/create_status/income_active_status.dart';
import 'package:productive/core/create_status/income_status.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/data/model/income_model.dart';
import 'package:productive/features/create/presentation/bloc/income_bloc.dart';
import 'package:productive/features/create/presentation/mixin/create_income_mixin.dart';
import 'package:productive/features/create/presentation/widgets/show_snackbar.dart';
import 'package:productive/features/create/presentation/widgets/w_text_field.dart';

import '../../../../assets/icons.dart';

class CreateIncomeScreen extends StatefulWidget {
  const CreateIncomeScreen({super.key});

  @override
  State<CreateIncomeScreen> createState() => _CreateIncomeScreenState();
}
class _CreateIncomeScreenState extends State<CreateIncomeScreen> with CreateIncomeMixin{
  @override
  void initState() {
    titleController = TextEditingController();
    noteController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncomeBloc(),
      child: BlocBuilder<IncomeBloc, IncomeState>(
        builder: (context, state) {
          switch (state.activeStatus) {
            case IncomeActiveStatus.success:
              return SafeArea(
                child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      title: Text(
                        context.localization.create_income,
                        style: context.style.fontSize24Weight700,
                      ),
                      leading: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 17),
                          child: SvgPicture.asset(AppIcons.arrow),
                        ),
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showBottomSheetWidget(context, state.incomeModel);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: getColor(state.incomeModel.priority),
                                  ),
                                  padding: EdgeInsets.all(9),
                                  child: SvgPicture.asset(
                                    getSvg(state.incomeModel.priority),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              Expanded(child: WTextField(
                                onChange: (a) {
                                  titleController!.text = a;
                                },
                              )),
                            ],
                          ),
                          Gap(31.5),
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
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: context.colors.btnSecondColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                        border: Border.all(
                                            width: 0.5,
                                            color:
                                                context.colors.btnBorderColor)),
                                    child: Text(
                                      context.localization.usd,
                                      style: context.style.fontSize14Weight500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: WTextField(
                                    onChange: (a) {
                                      a != "" ? (usd = int.parse(a)) : null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 8),
                                      border: InputBorder.none,
                                      hintText: "0.00",
                                      hintStyle: context
                                          .style.fontSize16Weight500
                                          .copyWith(
                                              color: context
                                                  .colors.isCheckGreenColor),
                                    ),
                                    keyboardType: TextInputType.number,
                                    style: context.style.fontSize16Weight500
                                        .copyWith(
                                            color: context
                                                .colors.isCheckGreenColor),
                                  ),
                                ),
                                const Gap(16),
                              ],
                            ),
                          ),
                          const Gap(18),
                          WTextField(
                            onChange: (a) {},
                            keyboardType: TextInputType.text,
                            style: context.style.fontSize14Weight500.copyWith(
                              color: context.colors.createTaskTime,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                              filled: true,
                              fillColor:
                                  context.colors.loginTextFieldBackgroundColor,
                              hintText: context.localization.add_note,
                              hintStyle:
                                  context.style.fontSize14Weight500.copyWith(
                                color: context.colors.createTaskTime,
                              ),
                            ),
                            maxLines: 7,
                          ),
                        ],
                      ),
                    )),
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
      ),
    );
  }
  @override
  void dispose() {
    titleController!.dispose();
    noteController!.dispose();
    super.dispose();
  }
}
