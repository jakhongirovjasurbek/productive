import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/widgets/select_color_expense.dart';
import 'package:productive/features/expense/presentation/bloc/get_expenses_bloc.dart';
import 'package:productive/features/expense/presentation/pages/error.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double income = 0;
    double outcome = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.localization.expenses,
          style: context.style.fontSize24Weight700,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.settings,
              width: 24.0,
              height: 24.0,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: SvgPicture.asset(context.icons.arrowBack),
          onPressed: () {},
        ),
      ),
      body: BlocBuilder<GetExpensesBloc, GetExpenseState>(
        builder: (context, state) {
          if (state.status == Status.pure) {
            context.read<GetExpensesBloc>().add(GetExpensesEventStarted());
            return const SizedBox();
          } else if (state.status == Status.fail) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ErrorScreen()));
            });
          } else if (state.status == Status.loading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          for (var i = 0; i < state.expenses.length; i++) {
            if (state.expenses[i].isIncome) {
              outcome = state.expenses[i].price + outcome;
            } else {
              income = state.expenses[i].price + income;
            }
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 77,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.expensesBackground,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  4.67, 5.13, 5.13, 5.16),
                              child: SvgPicture.asset(
                                AppIcons.arrowGreen,
                                width: 28.0,
                                height: 28.0,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: 9),
                            Column(
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  context.localization.income,
                                  style:
                                      context.style.fontSize14Weight500whitish,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "\$${income.toString()}",
                                  style: context.style.fontSize24Weight600,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 55.0, right: 44.0),
                          child: VerticalDivider(
                            color:
                                context.colors.expensesDivider.withOpacity(0.3),
                            thickness: 1,
                            width: 20,
                            endIndent: 10,
                            indent: 10,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  4.67, 5.13, 5.13, 5.16),
                              child: SvgPicture.asset(
                                AppIcons.arrowRed,
                                width: 28.0,
                                height: 28.0,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: 9),
                            Column(
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  context.localization.outcome,
                                  style:
                                      context.style.fontSize14Weight500whitish,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "\$${outcome.toString()}",
                                  style: context.style.fontSize24Weight600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.localization.categories,
                        style: context.style.fontSize18Weight600,
                      ),
                      Text(
                        context.localization.see_all,
                        style: context.style.fontSize16Weight400blue,
                      ),
                    ],
                  ),
                  const Gap(26),
                  SizedBox(
                    height: 195,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.expenses.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 106,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 19),
                                child: Container(
                                  width: 106,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: context
                                        .colors.loginTextFieldBackgroundColor,
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: colors[
                                              state.expenses[index].indexColor],
                                          borderRadius:
                                              BorderRadius.circular(22.5)),
                                      alignment: Alignment.center,
                                      child: SvgPicture.network(
                                          state.expenses[index].icon),
                                    ),
                                    const Gap(18),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        state.expenses[index].title,
                                        style: context.style.fontSize16Weight500
                                            .copyWith(
                                          color: colors[
                                              state.expenses[index].indexColor],
                                        ),
                                      ),
                                    ),
                                    const Gap(2),
                                    Center(
                                      child: Text(
                                        "\$${state.expenses[index].price.toString()}",
                                        style:
                                            context.style.fontSize16Weight500,
                                      ),
                                    ),
                                    const Gap(23),
                                    SvgPicture.asset(
                                      AppIcons.orangeVector,
                                      width: 106,
                                      height: 23.61,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 12,
                        );
                      },
                    ),
                  ),
                  const Gap(23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.localization.today_transactions,
                        style: context.style.fontSize18Weight600,
                      ),
                      Text(
                        context.localization.see_all,
                        style: context.style.fontSize16Weight400blue,
                      ),
                    ],
                  ),
                  const Gap(16),
                  ...List.generate(
                    state.expenses.length,
                    (index) => state.expenses[index].isIncome
                        ? Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 6, left: 12, right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: context.colors.notificationsClear
                                  .withOpacity(0.3)
                                  .withOpacity(0.3),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 23,
                                          width: 21,
                                          child: SvgPicture.network(
                                              state.expenses[index].icon),
                                        ),
                                        const Gap(6),
                                        Text(
                                          state.expenses[index].title,
                                          style:
                                              context.style.fontSize16Weight500,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "-\$${state.expenses[index].price}",
                                      style:
                                          context.style.fontSize18Weight500red,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Text(
                                  state.expenses[index].description,
                                  style: context.style.fontSize14Weight400grey,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 6, left: 12, right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: context.colors.expensesGreen2
                                  .withOpacity(0.3),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 23,
                                          width: 21,
                                          child: SvgPicture.network(
                                              state.expenses[index].icon),
                                        ),
                                        const Gap(6),
                                        Text(
                                          state.expenses[index].title,
                                          style:
                                              context.style.fontSize16Weight500,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "+\$${state.expenses[index].price}",
                                      style: context.style.fontSize18Weight500
                                          .copyWith(
                                              color:
                                                  context.colors.expensesGreen),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Text(
                                  state.expenses[index].description,
                                  style: context.style.fontSize14Weight400grey,
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
