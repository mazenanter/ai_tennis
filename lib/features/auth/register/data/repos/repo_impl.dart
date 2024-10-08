import 'package:ai_tennis/core/errors/firebase_failure.dart';
import 'package:ai_tennis/features/auth/register/data/models/user_register_model.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<FirebaseFailure, UserCredential>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? userId = auth.currentUser;
      final String uId = userId!.uid;
      saveUserInfo(uId, email, name);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      }
      return left(FirebaseServerFailure(e.toString()));
    }
  }

  void saveUserInfo(String uId, String email, String name) {
    FirebaseFirestore.instance.collection('users').doc(uId).set(
          UserRegisterModel(
            name: name,
            email: email,
            userId: uId,
          ).toJson(),
        );
  }
}
