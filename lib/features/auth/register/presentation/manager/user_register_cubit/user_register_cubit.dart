import 'package:ai_tennis/features/auth/register/data/repos/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_register_state.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  UserRegisterCubit(this.registerRepo) : super(UserRegisterInitial());
  final RegisterRepo registerRepo;
  void registerUser(
      {required String name,
      required String email,
      required String password}) async {
    emit(UserRegisterLoading());
    var res = await registerRepo.registerUser(
        name: name, email: email, password: password);

    return res.fold(
      (failure) => emit(UserRegisterErr(errMsg: failure.errMsg)),
      (success) => emit(UserRegisterSuccess()),
    );
  }
}
