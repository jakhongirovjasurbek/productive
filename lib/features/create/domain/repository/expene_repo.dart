import 'package:productive/features/create/data/model/expense_model.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class ExpenseRepository {
 
  Future<Either<Failure,bool>> createExpense(ExpenseModel expenseModel);
}