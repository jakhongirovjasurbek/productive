import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/authentication/domain/entity/user.dart';
import 'package:productive/features/authentication/domain/repository/auth_repo.dart';

import '../../../../core/usecase/usecase.dart';

class AuthUseCase implements UseCase<AuthUserEntity, Params> {
  final AuthRepository _repository;

  AuthUseCase(AuthRepository repository) : _repository = repository;

  @override
  Future<Either<Failure, AuthUserEntity>> call(Params params) async {
    if (params is GetStatusParams) {
      return _repository.getUser();
    } else if (params is SingUpParams) {
      return _repository.sign_up(params.email, params.password);
    } else if (params is LoginParams) {
      return _repository.login(params.email, params.password);
    } else {
      return throw UnimplementedError();
    }
  }
}
abstract class Params {}

class AuthenticateUseCaseResponse {}

class GetStatusParams extends Params {}

class LoginParams extends Params {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}

class SingUpParams extends Params {
  final String email;
  final String password;

  SingUpParams({required this.email, required this.password});
}
