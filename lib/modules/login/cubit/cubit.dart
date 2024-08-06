import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:sala7ly/modules/login/cubit/state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      Response response = await Dio().post(
        'https://sala7ly.vercel.app/userAuth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        String userToken = response.data['userToken'];
        emit(LoginSuccessState(userToken));
      } else {
        emit(LoginErrorState('Failed to login: ${response.data['msg']}'));
      }
    } catch (error) {
      emit(LoginErrorState('An error occurred: ${error.toString()}'));
    }
  }
}
