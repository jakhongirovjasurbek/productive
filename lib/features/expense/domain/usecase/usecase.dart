import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/core/usecase/usecase.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';
import 'package:productive/features/expense/domain/repository/expense.dart';

class GetExpenseUseCase implements UseCase<List<ExpenseEntity>, NoParams> {
  final ExpenseGetRepository _expenseGetRepository;
  GetExpenseUseCase({
    required ExpenseGetRepository expenseGetRepository,
  }) : _expenseGetRepository = expenseGetRepository;

  @override
  Future<Either<Failure, List<ExpenseEntity>>> call(NoParams param) async {
    if (param is GetExpensesParam) {
      return await _expenseGetRepository.getExpenses();
    } else {
      throw const ServerFailure(message: "Expense get xato", code: 304);
    }
  }
}

class GetExpensesParam extends NoParams {}
