part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}


class AuthenticationLogin extends AuthenticationEvent {
  final UserLoginModels userLoginModels;
  AuthenticationLogin({required this.userLoginModels});
}

class AuthenticationRegister extends AuthenticationEvent {
  final UserRegisterModels userRegisterModels;
  AuthenticationRegister({required this.userRegisterModels});
}