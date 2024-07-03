import '../../../model/userModel.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final Sala7lyUserModel userModel;

  RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterState {}

class RegisterChangeConfirmPasswordVisibilityState extends RegisterState {}
