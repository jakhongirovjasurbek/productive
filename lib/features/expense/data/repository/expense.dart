import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';
import 'package:productive/features/expense/data/data_source/network.dart';
import 'package:productive/features/expense/domain/repository/expense.dart';

class ExpenseGetRepositoryImpl implements ExpenseGetRepository {
  final ExpenseDataSource dataSource = ExpenseDataSource();
  @override
  Future<Either<Failure, List<ExpenseEntity>>> getExpenses() async {
    try {
      final response = await dataSource.getExpenses();
      final result = response.map((e) => ExpenseEntity.toEntity(e)).toList();
      return Right(result);
    } catch (error) {
      print("shottaman");
      return Left(
        ServerFailure(
          message: error.toString(),
          code: 500,
        ),
      );
    }
  }
}
