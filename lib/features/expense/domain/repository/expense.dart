import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';

abstract class ExpenseGetRepository {
  Future<Either<Failure, List<ExpenseEntity>>> getExpenses();
}
