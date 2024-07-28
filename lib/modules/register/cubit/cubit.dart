import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:sala7ly/modules/register/cubit/state.dart';

import '../../login/cubit/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String phoneNumber,
  }) async {
    try {
      if (password != passwordConfirm) {
        emit(RegisterError('Passwords do not match'));
        return;
      }

      if (password.length < 8) {
        emit(RegisterError('Password must be at least 8 characters'));
        return;
      }

      emit(RegisterLoading());
      final response = await Dio().post(
        'https://sala7ly.vercel.app/userAuth/signup',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'passwordConfirm': passwordConfirm,
          'phoneNumber': phoneNumber,
        },
      );

      if (response.statusCode == 201) {
        final data = response.data;
        final msg = data['msg'];
        emit(RegisterSuccess(msg));
        _sendVerificationEmail(email);
      } else {
        emit(RegisterError(response.data['msg'] ?? 'Unknown error'));
      }
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          final responseData = error.response?.data;
          if (responseData != null && responseData['errors'] != null) {
            final List<String> errors = List<String>.from(responseData['errors']);
            emit(RegisterError(errors.join('\n')));
          } else {
            emit(RegisterError(responseData['msg'] ?? 'Unknown error'));
          }
        } else {
          emit(RegisterError(error.message ?? 'Unknown error'));
        }
      } else {
        emit(RegisterError(error.toString()));
      }
    }
  }

  void _sendVerificationEmail(String email) async {
    try {
      await Dio().post(
        'https://sala7ly.vercel.app/userAuth/verifyemail',
        data: {'email': email},
      );
    } catch (error) {
      print('Error sending verification email: $error');
    }
  }

  IconData passwordSuffix = Icons.visibility_outlined;
  IconData confirmPasswordSuffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordSuffix = isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePassVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    confirmPasswordSuffix = isConfirmPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangecPassVisibility());
  }
}
