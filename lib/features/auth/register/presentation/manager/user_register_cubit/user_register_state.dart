part of 'user_register_cubit.dart';

@immutable
sealed class UserRegisterState {}

final class UserRegisterInitial extends UserRegisterState {}

final class UserRegisterLoading extends UserRegisterState {}

final class UserRegisterSuccess extends UserRegisterState {}

final class UserRegisterErr extends UserRegisterState {
  final String errMsg;

  UserRegisterErr({required this.errMsg});
}
