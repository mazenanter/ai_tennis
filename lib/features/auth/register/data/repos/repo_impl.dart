import 'package:ai_tennis/core/errors/failure.dart';
import 'package:ai_tennis/features/auth/register/data/models/user_register_model.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failure, UserCredential>> registerUser({
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
      saveUserInfo(uId, email, password);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseErr(e));
      }
      return left(ServerFailure(e.toString()));
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
