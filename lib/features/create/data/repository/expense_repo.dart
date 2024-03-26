import 'package:productive/features/create/data/model/expense_model.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repository/expene_repo.dart';
import '../data_source/remote_expense.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _expenseRemoteDataSource;

  ExpenseRepositoryImpl({required ExpenseRemoteDataSource expenseRemoteDataSource})
      : _expenseRemoteDataSource = expenseRemoteDataSource;
 

  @override
  Future<Either<Failure, bool>> createExpense(ExpenseModel expenseModel) async {
    try {
      final result = await _expenseRemoteDataSource.createExpense(expenseModel);
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }
}