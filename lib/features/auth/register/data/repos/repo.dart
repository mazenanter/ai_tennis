import 'package:ai_tennis/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserCredential>> registerUser(
      {required String name, required String email, required String password});
}
