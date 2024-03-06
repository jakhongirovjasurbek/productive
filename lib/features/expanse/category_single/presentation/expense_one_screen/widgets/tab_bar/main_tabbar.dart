import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/bloc/bloc.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/tab_bar/monthly_tabbar.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/tab_bar/weekly_tabbar.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/tab_bar/yearly_tabbar.dart';

class SingleCategory extends StatefulWidget {
  const SingleCategory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SingleCategoryState createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _diagramBloc = DiagramBloc();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiagramBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<DiagramBloc, DiagramState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(context.icons.imgArrowLeft)),
                    const Spacer(),
                    Text(
                      context.localization.food,
                      style: context.style.fontSize16Weight700,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                           SvgPicture.asset(
                        context.icons.imgThumbsUp,
                        // ignore: deprecated_member_use
                        // color: context.colors.buttonDisabledColor,
                        color: Colors.red,
                      );
                          isPressed = false;
                        });
                      },
                      child: SvgPicture.asset(
                        context.icons.imgThumbsUp,
                        // ignore: deprecated_member_use
                        color: context.colors.whiteA700,
                      ),
                    ),
                    const Gap(16),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                                SvgPicture.asset(
                        context.icons.imgThumbsUp,
                        // ignore: deprecated_member_use
                        // color: context.colors.buttonDisabledColor,
                        color: Colors.red,
                      );
                            isPressed = true;
                          });
                        },
                        child: SvgPicture.asset(context.icons.imgThumbsUpWhite,
                            // ignore: deprecated_member_use
                            color: context.colors.whiteA700)),
                  ],
                ),
                backgroundColor: context.colors.bacgroundColor,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight + 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.colors.tabbarcontainer,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: context.localization.weekly),
                          Tab(text: context.localization.monthly),
                          Tab(text: context.localization.yearly),
                        ],
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.onBordingComponet,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: context.colors.whiteA700,
                        unselectedLabelColor: context.colors.tasksTimeColor,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                        labelStyle: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                   WeeklyTabBar(isPressed:isPressed ,),
                  MonthlyTabBar(
                    isPressed: isPressed,
                  ),
                   YearlyTabBar(
                    isPressed: isPressed,

                   ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _diagramBloc.close();

    super.dispose();
  }
}
