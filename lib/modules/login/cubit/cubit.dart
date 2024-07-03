import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sala7ly/modules/login/cubit/state.dart';

import '../../../model/userModel.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  void userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());

    final url = Uri.parse('http://sala7lyapi.runasp.net/api/Client/LogIn');
    final response = await http.post(
      url,
      body: {
        'Email': email,
        'Password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final userModel = Sala7lyUserModel(
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        phone: data['phone'],
      );

      emit(LoginSuccessState(userModel));
    } else {
      emit(LoginErrorState('Login failed'));
    }
  }


}
