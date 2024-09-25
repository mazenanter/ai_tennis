import 'package:ai_tennis/features/auth/login/data/repos/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_user_cubit_state.dart';

class LoginUserCubitCubit extends Cubit<LoginUserCubitState> {
  LoginUserCubitCubit(this.loginUserRepo) : super(LoginUserCubitInitial());

  final LoginUserRepo loginUserRepo;
  void loginUser({required String email, required String password}) async {
    emit(LoginUserCubitLoading());
    var res = await loginUserRepo.loginUser(email: email, password: password);
    return res.fold(
      (failure) => emit(LoginUserCubitError(errMsg: failure.errMsg)),
      (success) => emit(LoginUserCubitSuccess()),
    );
  }
}
