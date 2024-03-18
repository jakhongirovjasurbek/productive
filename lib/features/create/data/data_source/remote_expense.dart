import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/data/model/expense_model.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';
import '../../../../core/exception/exception.dart';

abstract class ExpenseRemoteDataSource {
  Future<List<ExpenseEntity>> getExpenses();
  Future<bool> createExpense(ExpenseModel expenseModel);

  factory ExpenseRemoteDataSource() => _ExpenseRemoteDataSource();
}

class _ExpenseRemoteDataSource implements ExpenseRemoteDataSource{
  @override
  Future<List<ExpenseEntity>> getExpenses() async {
    final firebase = FirebaseFirestore.instance;
    final collection = await firebase.collection('expense').get();
    final expense = collection.docs.map((e) => ExpenseModel.fromJson(e.data(),e.id)).toList();
    if (expense.isNotEmpty) {
      return expense.map((e) => e.toExpenseEntities).toList();
    }
    else {
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> createExpense(ExpenseModel expenseModel) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('expense').add(
        expenseModel.toJson(),
      );
      return true;
    } catch(e) {
      throw ServerException(
          errorMessage: "Cannot create expense",
          errorCode: '666'
      );
    }
  }
}