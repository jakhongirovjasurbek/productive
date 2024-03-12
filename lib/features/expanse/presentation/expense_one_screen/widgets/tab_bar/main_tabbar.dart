import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/presentation/expense_one_screen/widgets/tab_bar/monthly_tabbar.dart';
import 'package:productive/features/expanse/presentation/expense_one_screen/widgets/tab_bar/weekly_tabbar.dart';
import 'package:productive/features/expanse/presentation/expense_one_screen/widgets/tab_bar/yearly_tabbar.dart';




class SingleCategory extends StatefulWidget {
  const SingleCategory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SingleCategoryState createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this,  );
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
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
                    color: context.colors.buttonDisabledColor,
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
                    color: context.colors.buttonDisabledColor,
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

                    labelStyle: context.style.fontSize16Weight400,


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
      
  }

  
}
