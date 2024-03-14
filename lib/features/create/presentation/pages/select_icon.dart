import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';
import 'package:productive/features/create/presentation/pages/create_expense.dart';

import '../../../../assets/icons.dart';
import '../widgets/expense_bottom_sheet.dart';
import '../widgets/select_color_expense.dart';
import '../widgets/select_icon_expense.dart';


class NewSelectIcon extends StatefulWidget {
  const NewSelectIcon({super.key});

  @override
  State<NewSelectIcon> createState() => _NewSelectIconState();
}

class _NewSelectIconState extends State<NewSelectIcon>
    with TickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController titleController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
            title:  Text(
              context.localization.new_category,
              style:  context.style.fontSize24Weight700.copyWith(color: context.colors.whiteLabel, ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                            child: SvgPicture.asset(state.selectIcon,),
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: TextField(
                            style:  context.style.fontSize16Weight500.copyWith(color: context.colors.whiteLabel, ),
                            controller: titleController,
                            // cursorColor: ,
                            decoration:  InputDecoration(
                              hintText: context.localization.new_title,
                              hintStyle: context.style.fontSize14Weight500.copyWith(color: context.colors.createTaskTime, ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: TabBar(
                      // indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      tabs:  [
                        Tab(
                            child: Text(context.localization.icon,
                                style: context.style.fontSize18Weight700),),
                        Tab(
                            child: Text(context.localization.color,
                                style: context.style.fontSize18Weight700)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 484,
                    width: double.infinity,
                    child: TabBarView(
                      controller: tabController,
                      children: const <Widget>[
                        IconTabBar(),
                        ColorTabBar(),
                      ],
                    ),
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateExpanse(),));
              },
              child: Text(context.localization.confirm),
            ),
          ),
        );
      },
    );
  }
}
