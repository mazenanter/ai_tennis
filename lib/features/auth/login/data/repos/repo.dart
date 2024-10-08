import 'package:ai_tennis/core/errors/firebase_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUserRepo {
  Future<Either<FirebaseFailure, UserCredential>> loginUser(
      {required String email, required String password});
}
