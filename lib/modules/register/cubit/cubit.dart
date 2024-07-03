import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala7ly/modules/register/cubit/state.dart';

import '../../../model/userModel.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  Sala7lyUserModel? userModel;

  // Password visibility
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  // Confirm Password visibility
  bool isConfirmPassword = true;
  IconData suffixConfirm = Icons.visibility_outlined;

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    suffixConfirm = isConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangeConfirmPasswordVisibilityState());
  }

  void userRegister({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String confirmPassword,
  }) async {
    emit(RegisterLoadingState());

    try {
      // Simulate API call or use http package for real API calls
      await Future.delayed(Duration(seconds: 2)); // Replace with your API call

      userModel = Sala7lyUserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      emit(RegisterSuccessState(userModel!)); // Pass the userModel here

      // Example error state emission
      // emit(RegisterErrorState('Error message'));
    } catch (e) {
      emit(RegisterErrorState('Error: $e'));
    }
  }

}

