import 'package:productive/features/create/data/model/expense_model.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/expene_repo.dart';

class GetExpenseUsecase implements UseCase<List<ExpenseEntity>, NoParams>{
  final ExpenseRepository _expenseRepository;

  GetExpenseUsecase({required ExpenseRepository expenseRepository})
      : _expenseRepository = expenseRepository;
  @override
  Future<Either<Failure, List<ExpenseEntity>>> call(param) async {
    if (param is GetExpense) {
      return await _expenseRepository.getExpenses();
    }
    throw UnimplementedError();
  }

}
class GetExpense extends NoParams {}

class CreateExpense extends NoParams {
  final ExpenseModel expenseModel;

  CreateExpense({required this.expenseModel});
}

class CreateExpenseUsecase implements UseCase<bool , NoParams> {
  final ExpenseRepository _expenseRepository;

  CreateExpenseUsecase({required ExpenseRepository expenseRepository})
      : _expenseRepository = expenseRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is CreateExpense) {
      return await _expenseRepository.createExpense(param.expenseModel);
    }
    throw UnimplementedError();
  }}