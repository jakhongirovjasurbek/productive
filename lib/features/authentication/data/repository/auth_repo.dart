import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/authentication/data/data_source/remote.dart';
import 'package:productive/features/authentication/data/model/user.dart';
import 'package:productive/features/authentication/domain/entity/user.dart';

import '../../../../core/exception/exception.dart';
import '../../domain/repository/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthenticationDataSource _dataSource;
  const AuthRepositoryImpl({required AuthenticationDataSource dataSource}):_dataSource=dataSource;

  @override
  Future<Either<Failure, AuthUserEntity>> getUser() async{
    try {
      final user = await _dataSource.getUser();
      return Right(AuthUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> login(String email, String password)async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async{
    try {
      final response = await _dataSource.logout();
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> sign_up(String email, String password) async{
    try {
      final response = await _dataSource.sing_up(email, password);
      return Right(AuthUserModel.fromFirebaseUser(response));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }
}