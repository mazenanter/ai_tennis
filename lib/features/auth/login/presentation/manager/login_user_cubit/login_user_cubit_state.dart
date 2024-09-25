part of 'login_user_cubit_cubit.dart';

@immutable
sealed class LoginUserCubitState {}

final class LoginUserCubitInitial extends LoginUserCubitState {}

final class LoginUserCubitLoading extends LoginUserCubitState {}

final class LoginUserCubitSuccess extends LoginUserCubitState {}

final class LoginUserCubitError extends LoginUserCubitState {
  final String errMsg;

  LoginUserCubitError({required this.errMsg});
}
