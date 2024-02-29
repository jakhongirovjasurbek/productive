import 'package:equatable/equatable.dart';
import 'expenseone_item_model.dart';

// ignore: must_be_immutable
class ExpenseOneModel extends Equatable {
  ExpenseOneModel({this.expenseoneItemList = const []});

  List<ExpenseoneItemModel> expenseoneItemList;

  ExpenseOneModel copyWith({List<ExpenseoneItemModel>? expenseoneItemList}) {
    return ExpenseOneModel(
      expenseoneItemList: expenseoneItemList ?? this.expenseoneItemList,
    );
  }

  @override
  List<Object?> get props => [expenseoneItemList];
}
