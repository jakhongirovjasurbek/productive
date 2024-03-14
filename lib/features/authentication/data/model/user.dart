import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entity/user.dart';

class AuthUserModel extends AuthUserEntity{
  const AuthUserModel({required super.email});
  factory AuthUserModel.fromFirebaseUser(User user){
    return AuthUserModel(email: user.email ?? "");
  }
}