// state.dart

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}
class EmailVerificationSent extends RegisterState {}
// class RegisterSuccessEmail extends RegisterState {
//   final String email;
//
//   RegisterSuccess(this.email);
// }
class RegisterSuccess extends RegisterState {
  final String userToken;

  RegisterSuccess(this.userToken);
}
class RegisterError extends RegisterState {
  final String error;

  RegisterError(this.error);
}

class ChangePassVisibility extends RegisterState {}

class ChangecPassVisibility extends RegisterState {}

class EmailVerified extends RegisterState {}
