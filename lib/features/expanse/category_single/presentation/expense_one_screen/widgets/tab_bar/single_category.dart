import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/fl_charts/diagramma.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/fl_charts/line_graph.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/fl_charts/years_line.dart';

class SingleCategory extends StatefulWidget {
  const SingleCategory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SingleCategoryState createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory>
    with SingleTickerProviderStateMixin {
  var index = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(context.icons.imgArrowLeft),
            const Spacer(),

            // Text(context.localization.email_verification,style: context.style.fontSize24Weight600,),
            Text(
              context.localization.food,
              style: context.style.fontSize16Weight700,
            ),
            const Spacer(),

            GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: SvgPicture.asset(
                  context.icons.imgThumbsUp,
                  color: index == 1 ? Colors.white : Colors.blue,
                )),
            const Gap(16),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(context.icons.imgThumbsUpWhite)),
          ],
        ),
        backgroundColor: const Color(0xFF131524),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.localization.weekly),
            Tab(text: context.localization.monthly),
            Tab(text: context.localization.yearly),
          ],
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          labelStyle: const TextStyle(fontSize: 16.0),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF131524),
                  child: Center(child: BarChartSample2()),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        context.localization.transactions,
                        style: context.style.fontSize20Weight700,
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                // konteyner
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.maxFinite,
                    height: 93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.timeContainerOne,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Gap(5),
                            SvgPicture.asset(context.icons.imgBxRestaurant),
                            const Gap(10),
                            Text(
                              context.localization.eye_doctor_review,
                              overflow: TextOverflow.clip,
                            ),
                            const Gap(180),
                            const Text('-\$20'),
                          ],
                        ),
                        Gap(10),
                        Row(
                          children: [
                            Text(
                              context.localization
                                  .eyes_doctor_review_green_description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(10),

                // ikkinchi konteyner

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.maxFinite,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.yashil,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Gap(5),
                            SvgPicture.asset(context.icons.imgBxRestaurant),
                            const Gap(10),
                            Text(
                              context.localization.eye_doctor_review,
                              overflow: TextOverflow.visible,
                            ),
                            const Gap(180),
                            const Text('+\$50'),
                          ],
                        ),
                      
                      ],
                    ),
                  ),
                ),

                

                // uchunchi konteyner
             
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.maxFinite,
                    height: 93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.yashil,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Gap(5),
                            SvgPicture.asset(context.icons.imgBxRestaurant),
                            const Gap(10),
                            Text(
                              context.localization.eye_doctor_review,
                            ),
                            const Gap(180),
                            const Text('+\$20'),
                          ],
                        ),
                        Gap(20),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                context.localization
                                    .eyes_doctor_review_green_description,
                                overflow:TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),





                      ],
                    ),
                  ),
                ),
                const Gap(10),
              
              
              ],
            ),
          ),

// ikkinchi tab bar
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF131524),
                  child: const Center(child: LineChartSample2()),
                ),
              ],
            ),
          ),

// yillik  3 tabbar
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF131524),
                  child: Center(child: YearlyTab()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
