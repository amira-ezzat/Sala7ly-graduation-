import '../../../model/userModel.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final Sala7lyUserModel userModel;
  LoginSuccessState(this.userModel);
  // يمكنك إضافة الحقول الضرورية لتخزين بيانات الاستجابة الناجحة هنا
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginState {}
