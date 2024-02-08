part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class UserLoginLoadingState extends LoginState {}

class UserLoginSuccessState extends LoginState {}

class UserLoginErrorState extends LoginState {
  final String loginErrorMessage;

  UserLoginErrorState(this.loginErrorMessage);
}

class LoginPasswordVisibilityChangedState extends LoginState {
  final bool isVisible;

  LoginPasswordVisibilityChangedState(this.isVisible);
}
