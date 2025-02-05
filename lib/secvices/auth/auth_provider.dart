import 'package:app1/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get authStateChanges;
  Future<AuthUser> logIn
}