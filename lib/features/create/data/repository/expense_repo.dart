import 'package:productive/features/create/data/data_source/mock_expense.dart';
import 'package:productive/features/create/data/model/expense_model.dart';

class ExpenseRepository {
  Future<List<ExpenseModel>> getExpenses()async {
    Future.delayed(const Duration(seconds: 3));

    return (dataExpense['expense']as List).map((e) => ExpenseModel.fromJson(e)).toList();

  }

  Future<ExpenseModel> createExpense({
    required String icon,
    required String title,
    required int colorIndex,
    required double price,
    required String description,
  }) async {

    await Future.delayed(const Duration(seconds: 3),);

    if (title.isEmpty || title.length < 3) {
      throw Exception('Title is invalid');
    }
    final newExpense = ExpenseModel(
        id: (dataExpense['expense'] as List).lastOrNull['id'] + 1 ?? 0,
        icon: icon,
        colorIndex: colorIndex,
        title: title,
        price: price,
        description: description
    );

    dataExpense['expense'].add(
      {
        "id": newExpense.id,
        "title": newExpense.title,
        "icon": newExpense.icon,
        "colorIndex" : newExpense.colorIndex,
        "price": newExpense.price,
        "description": newExpense.description,
      },

    );

    return newExpense;
  }


}