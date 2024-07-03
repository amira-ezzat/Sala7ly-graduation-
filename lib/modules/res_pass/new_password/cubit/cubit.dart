import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala7ly/modules/register/cubit/state.dart';
import 'package:sala7ly/modules/res_pass/new_password/cubit/state.dart';

class ResetCubit extends Cubit<ResetState>
    implements StateStreamable<ResetState> {
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
}
