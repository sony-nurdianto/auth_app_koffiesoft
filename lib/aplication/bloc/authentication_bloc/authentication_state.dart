part of 'authentication_bloc.dart';


@immutable
sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {

}

class AuthenticationFailure extends AuthenticationState {}

