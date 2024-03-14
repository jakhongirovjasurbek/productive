import 'package:productive/core/failure/failure.dart';
import '../../../../core/either/either.dart';
import '../entity/user.dart';
abstract class AuthRepository {
  Future<Either<Failure, AuthUserEntity>> getUser();
  Future<Either<Failure, AuthUserEntity>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, AuthUserEntity>> sign_up(String email, String password);
}
