import 'package:productive/features/create/data/model/expense_model.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, List<ExpenseEntity>>> getExpenses();
  Future<Either<Failure,bool>> createExpense(ExpenseModel expenseModel);
}