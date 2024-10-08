import 'package:ai_tennis/core/errors/firebase_failure.dart';
import 'package:ai_tennis/features/auth/login/data/repos/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUserRepoImpl extends LoginUserRepo {
  @override
  Future<Either<FirebaseFailure, UserCredential>> loginUser(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(userCredential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      }
      return left(FirebaseServerFailure(e.toString()));
    }
  }
}
