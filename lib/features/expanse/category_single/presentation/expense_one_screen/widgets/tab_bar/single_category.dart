import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/diagramma.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/single_category/img_arrow left.svg'),
            const Gap(10),
            // Text(context.localization.email_verification,style: context.style.fontSize24Weight600,),
             Text(
              context.localization.food,
              style:context.style.fontSize12Weight400,
              
            ),

            
            SvgPicture.asset(context.icons.imgBxRestaurant),
            SvgPicture.asset(context.icons.imgArrowLeft),
          ],
        ),
        backgroundColor: const Color(0xFF131524),
        
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Expanded(child: Tab(text: 'Weekly')),
            Tab(text: 'Monthly'),
            Tab(text: 'Yearly'),
          ],
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    // const SizedBox(
                    //   width: 38,
                    // ),
                    Text(
                      'Transactions',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                // Gap(16),
                Container(
                  width: 343,
                  height: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colors.timeContainerOne,
                  ),
                ),
                const Gap(12),
                Container(
                  width: 343,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                ),
                const Gap(12),
                Container(
                  width: 343,
                  height: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Padding(padding: EdgeInsets.only(top: 50, left: 15)),
                      Row(
                        children: [
                          SvgPicture.asset(context.icons.imgBxRestaurant),

                          const Gap(10),
                      const Text(
                        'Lorem upv uksebvufkuysebkuybs',
                        overflow: TextOverflow.clip,
                      ),


                      const Gap(60),

                      const Text('\$20'),

                        ],
                      ),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text('\$20'),
                      //   ],
                      // ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [ 
                      //     Text('11:30'),
                      //   ],
                      // )
                    ],
                  ),
                ),

                // Container(
                //   width: 200,
                //   height: 400,
                //   color: Colors.yellow,
                // ),
              ],
            ),
          ),
          Container(
            child: const Center(
              child: Text('Tab 2 Content'),
            ),
          ),
          Container(
            child: const Center(
              child: Text('Tab 3 Content'),
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
