part of 'expense_one_bloc.dart';

// ignore: must_be_immutable
class ExpenseOneState extends Equatable {
  ExpenseOneState({this.expenseOneModelObj});

  ExpenseOneModel? expenseOneModelObj;

  @override
  List<Object?> get props => [
        expenseOneModelObj,
      ];

  ExpenseOneState copyWith({ExpenseOneModel? expenseOneModelObj}) {
    return ExpenseOneState(
      expenseOneModelObj: expenseOneModelObj ?? this.expenseOneModelObj,
    );
  }
}
