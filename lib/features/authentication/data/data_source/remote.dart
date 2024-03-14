import 'package:firebase_auth/firebase_auth.dart';
import 'package:productive/core/exseption/exseption.dart';

abstract class AuthenticationDataSource {
  Future<User> getUser();
  Future<User> login(String email, String password);
  Future<User> sing_up(String email, String password);
  Future<void> logout();
  factory AuthenticationDataSource() =>
      _AuthenticationDataSourceImpl();
}

class _AuthenticationDataSourceImpl
    implements AuthenticationDataSource {
  @override
  Future<User> getUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerException(errorMassege: "User is null", errorCode: "140");
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        errorMassege: "$error",
        errorCode: "500",
      );
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    $email");
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await getUser();
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(errorMassege: "$error", errorCode: "500");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ServerException(errorMassege: "Cannot logout the user", errorCode: "500");
    }
  }

  @override
  Future<User> sing_up(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerException(errorMassege: "message", errorCode: "500");
    }
  }
}
