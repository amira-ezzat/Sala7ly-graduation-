import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala7ly/modules/res_pass/congrate.dart';
import 'package:sala7ly/modules/res_pass/new_password/cubit/cubit.dart';
import 'package:sala7ly/modules/res_pass/new_password/cubit/state.dart';

import '../../../shared/componants/textFormField.dart';

class NewPassword extends StatelessWidget {
  final String email;  // Add this to accept email from the previous screen
  final TextEditingController newController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  NewPassword({required this.email});  // Accept email via constructor

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetCubit(),
      child: BlocConsumer<ResetCubit, ResetState>(
        listener: (BuildContext context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CongrateScreen(userToken: state.userToken)),
            );
          } else if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (BuildContext context, ResetState state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Create New Password",
                      style: TextStyle(
                        color: Color(0xFFF0630B),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your new password must be different from previously used passwords.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    defaultTextFormField(
                      controller: newController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter New Password".tr();
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters".tr();
                        }
                        return null;
                      },
                      isPassword: ResetCubit.get(context).isPasswordVisible,
                      suffixPressed: () {
                        ResetCubit.get(context).changePasswordVisibility();
                      },
                      label: 'Password'.tr(),
                      prefix: Icons.lock_outline,
                      suffix: ResetCubit.get(context).passwordSuffix,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '        must be at least 8 characters'.tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 60.0),
                    defaultTextFormField(
                      controller: confirmController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Confirm Password'.tr();
                        }
                        if (value != newController.text) {
                          return 'Passwords do not match'.tr();
                        }
                        return null;
                      },
                      isPassword: ResetCubit.get(context).isConfirmPasswordVisible,
                      suffixPressed: () {
                        ResetCubit.get(context).changeConfirmPasswordVisibility();
                      },
                      label: 'Confirm Password'.tr(),
                      prefix: Icons.lock_outline,
                      suffix: ResetCubit.get(context).confirmPasswordSuffix,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '        both passwords must match'.tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    ConditionalBuilder(
                      condition: state is ResetPasswordLoading,
                      builder: (BuildContext context) => Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF0630B)),
                        ),
                      ),
                      fallback: (BuildContext context) => Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF0630B),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ResetCubit.get(context).resetPassword(
                                email,
                                newController.text,
                                confirmController.text,
                              );
                            }
                          },
                          child: Text(
                            'Create',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
