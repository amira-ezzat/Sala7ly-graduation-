abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String userToken;


  LoginSuccessState(
      this.userToken,
      );
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}
