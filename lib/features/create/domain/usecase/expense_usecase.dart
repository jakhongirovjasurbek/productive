import 'package:productive/features/create/data/model/expense_model.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/expene_repo.dart';

class CreateExpense extends NoParams {
  final ExpenseModel expenseModel;

  CreateExpense({required this.expenseModel});
}

class CreateExpenseUsecase implements UseCase<bool, NoParams> {
  final ExpenseRepository _expenseRepository;

  CreateExpenseUsecase({required ExpenseRepository expenseRepository})
      : _expenseRepository = expenseRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is CreateExpense) {
      return await _expenseRepository.createExpense(param.expenseModel);
    }
    throw UnimplementedError();
  }
}
