import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sala7ly/modules/res_pass/new_password/cubit/state.dart';

class ResetCubit extends Cubit<ResetState> {
  ResetCubit() : super(ResetInitiat());
  static ResetCubit get(context) => BlocProvider.of(context);

  IconData passwordSuffix = Icons.visibility_outlined;
  IconData confirmPasswordSuffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordSuffix = isPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ResetPassVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    confirmPasswordSuffix = isConfirmPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ResetcPassVisibility());
  }

  void resetPassword(String email, String password, String confirmPassword) async {
    emit(ResetPasswordLoading());

    // Validate password confirmation
    if (password != confirmPassword) {
      emit(ResetPasswordError(error: 'Passwords do not match.'));
      return;
    }

    try {
      final response = await http.patch(
        Uri.parse('https://sala7ly.vercel.app/userAuth/resetpassword'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'passwordConfirm': confirmPassword,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['statusCode'] == 200) {
          String userToken = responseBody['userToken'];
          emit(ResetPasswordSuccess(message: responseBody['msg'], userToken: userToken));
        } else {
          emit(ResetPasswordError(error: responseBody['msg']));
        }
      } else {
        print('Request failed with status: ${response.statusCode}. Body: ${response.body}');
        emit(ResetPasswordError(error: 'Error: ${response.statusCode} - ${response.reasonPhrase}'));
      }
    } catch (e) {
      print('Exception caught: $e');
      emit(ResetPasswordError(error: 'An error occurred while resetting the password: $e'));
    }
  }
}
