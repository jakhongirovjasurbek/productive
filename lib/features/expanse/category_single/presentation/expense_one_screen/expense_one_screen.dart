import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/assets/app_decoration.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/app_bar/appbar_title.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/widgets/app_bar/custom_app_bar.dart';
import 'widgets/expenseone_item_widget.dart';
import 'models/expenseone_item_model.dart';
import 'models/expense_one_model.dart';
import 'package:flutter/material.dart';
import 'bloc/expense_one_bloc.dart';

// ignore_for_file: must_be_immutable
class ExpenseOneScreen extends StatelessWidget {
  ExpenseOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();


  @override
  Widget build(BuildContext context) {

 return BlocProvider<ExpenseOneBloc>(
      create: (context) => ExpenseOneBloc(
        ExpenseOneState(
          expenseOneModelObj: ExpenseOneModel(),
        ),
      )..add(
          ExpenseOneInitialEvent(context),
        ),
      child: 

     Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            _buildAppBar(context),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildFrame1(context),
                  const SizedBox(height: 34),
                  _buildElementsData(context),
                  const SizedBox(height: 11),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 43, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '2',
                            style: context.style.fontSize14Weight500,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(  '4',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('6',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('8',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('12',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('14',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('18',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('20',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('22',
                                style: context.style.fontSize14Weight500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              '26',
                              style: context.style.fontSize14Weight500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              '28',
                              style: context.style.fontSize14Weight500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                               '30',
                              style: context.style.fontSize14Weight500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 42),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.localization.transactions,
                      style: context.style.fontSize18Weight600.copyWith(
                        color: context.colors.whiteA700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildExpenseOne(context)
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  
  
  
  
  
    );

  
  
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(
              leadingWidth: 40,
              leading: SvgPicture.asset(
                AppIcons.imgArrowLeft,
              ),
              centerTitle: true,
              title: AppbarTitle(text: context.localization.food),
              actions: [
                SvgPicture.asset(
                  AppIcons.imgThumbsUpWhite,
                )
              ]),
          const SizedBox(height: 34),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: AppDecoration.fillBlueGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    context.localization.weekly,
                    style: context.style.fontSize16Weight600.copyWith(
                      color: context.colors.tasksTimeColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    context.localization.monthly,
                    style: context.style.fontSize16Weight600.copyWith(
                      color: context.colors.whiteA700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    context.localization.yearly,
                    style: context.style.fontSize18Weight600.copyWith(
                      color: context.colors.tasksTimeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrame1(BuildContext context) {
    return Container(
      width: 343,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      decoration: AppDecoration.gradientBlueGrayToBlueGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.food,
            style: context.style.fontSize18Weight600.copyWith(
              color: context.colors.expensesFood,
            ),
          ),
          const SizedBox(height: 3),
          RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      // text: context.localization.lbl_5d,
                      style: context.style.fontSize24Weight600),
                  TextSpan(
                      // text: context.localization.lbl_0_00,
                      style: context.style.fontSize24Weight600),
                ],
              ),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }

  Widget _buildElementsData(BuildContext context) {
    return SizedBox(
      height: 177,
      width: 327,
      child: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          // child: _buildFrame(context, price: context.localization.lbl_150),
        ),
        // _buildFrame(context, price: context.localization.lbl_100),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          // child: _buildFrame(context, price: context.localization.lbl_50),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0',
                style: context.style.fontSize18Weight600.copyWith(
                  color: context.colors.tasksTimeColor,
                ),
              ),
              const Expanded(
                child: Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(top: 9, bottom: 5),
                    child: Divider(
                      indent: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildFrame(context, price: '200'),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: SizedBox(
              height: 45,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 85),
            child: SizedBox(
              height: 113,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 65),
            child: SizedBox(
              height: 75,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 126),
            child: SizedBox(
              height: 128,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 153),
            child: SizedBox(
              height: 97,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 105),
            child: SizedBox(
              height: 84,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 142),
            child: SizedBox(
              height: 134,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 117),
            child: SizedBox(
              height: 134,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
                endIndent: 9,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 88),
            child: SizedBox(
              height: 151,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 57),
            child: SizedBox(
              height: 161,
              child: VerticalDivider(
                width: 6,
                thickness: 6,
                color: context.colors.expensesFood,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 31),
            child: SizedBox(
              height: 50,
              child: VerticalDivider(
                  width: 6,
                  thickness: 6,
                  color: context.colors.expensesFood,
                  endIndent: 9),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 1),
            child: SizedBox(
              height: 40,
              child: VerticalDivider(
                  width: 6,
                  thickness: 6,
                  color: context.colors.expensesFood,
                  endIndent: 9),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildExpenseOne(BuildContext context) {
    return BlocSelector<ExpenseOneBloc, ExpenseOneState, ExpenseOneModel?>(
        selector: (state) => state.expenseOneModelObj,
        builder: (context, expenseOneModelObj) {
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemCount: expenseOneModelObj?.expenseoneItemList.length ?? 0,
              itemBuilder: (context, index) {
                ExpenseoneItemModel model =
                    expenseOneModelObj?.expenseoneItemList[index] ??
                        ExpenseoneItemModel(context: context);
                return ExpenseoneItemWidget(model);
              });
        });
  }
}

Widget _buildFrame(
  BuildContext context, {
  required String price,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        price,
        style: context.style.fontSize18Weight600.copyWith(
          color: context.colors.tasksTimeColor,
        ),
      ),
      const Expanded(
        child: Opacity(
          opacity: 0.6,
          child: Padding(
            padding: EdgeInsets.only(top: 6, bottom: 8),
            child: Divider(indent: 9),
          ),
        ),
      ),
    ],
  );
}
