abstract class ResetState {}
class ResetInitiat extends ResetState {}
class ResetPassVisibility extends ResetState {}
class ResetcPassVisibility extends ResetState {}
class ResetPasswordLoading extends ResetState {}
class ResetPasswordSuccess extends ResetState {
  final String message;
  final String userToken;
  ResetPasswordSuccess({required this.message,required this.userToken});
}
class ResetPasswordError extends ResetState {
  final String error;
  ResetPasswordError({required this.error});
}