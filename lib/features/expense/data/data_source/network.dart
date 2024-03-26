import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:productive/core/exception/exception.dart';
import 'package:productive/features/create/data/model/expense_model.dart';

abstract class ExpenseDataSource {
  Future<List<ExpenseModel>> getExpenses();

  factory ExpenseDataSource() => _ExpenseDataSource();
}

class _ExpenseDataSource implements ExpenseDataSource {
  @override
  Future<List<ExpenseModel>> getExpenses() async {
    try {
      final firebase = FirebaseFirestore.instance;
      final collection = await firebase.collection("expense").get();

      final expenses = collection.docs
          .map((e) => ExpenseModel.fromJson(e.data(), e.id))
          .toList();
      if (expenses.isEmpty) {
        print("error firebase");
      }

      return expenses;
    } on ServerException catch (error) {
      
      throw ServerException(
          errorMessage: error.errorMessage, errorCode: error.code);
    }
  }
}
