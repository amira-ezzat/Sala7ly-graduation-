import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/register/veryEmail.dart';

import '../../shared/componants/navegate.dart';
import '../../shared/componants/textFormField.dart';
import '../../shared/cubit/cubit.dart';
import '../login/login.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class RegisterPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var numberController = TextEditingController();
  var confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (BuildContext context, RegisterState state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Successfully Registered').tr(),
                backgroundColor: Colors.green,
              ),
            );
            navigateTo(context, VerifyEmail(email: emailController.text));
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration failed: ${state.error}').tr(),
              ),
            );
          }
        },
        builder: (BuildContext context, RegisterState state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Sign up'.tr(),
                          style: TextStyle(
                            fontFamily: 'font1',
                            fontSize: 30.0,
                            color: HexColor('#F0630B'),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: firstController,
                            cursorColor: Colors.grey.shade500,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name'.tr();
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'First Name'.tr(),
                              labelStyle: TextStyle(
                                fontFamily: 'font4',
                                color: Colors.grey.shade400,
                                fontSize: 16,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline_outlined,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 13.0),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: lastController,
                            cursorColor: Colors.grey.shade500,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name'.tr();
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Last Name'.tr(),
                              labelStyle: TextStyle(
                                fontFamily: 'font4',
                                color: Colors.grey.shade400,
                                fontSize: 16,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 13.0),
                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Address'.tr();
                            }
                          },
                          label: 'Email Address'.tr(),
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(height: 13.0),
                        defaultTextFormField(
                          controller: numberController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Phone Number'.tr();
                            }
                          },
                          label: 'Phone Number'.tr(),
                          prefix: Icons.phone,
                        ),
                        SizedBox(height: 13.0),
                        defaultTextFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password'.tr();
                            }
                          },
                          isPassword:
                          RegisterCubit.get(context).isPasswordVisible,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password'.tr(),
                          prefix: Icons.lock_outline,
                          suffix:
                          RegisterCubit.get(context).passwordSuffix,
                        ),
                        SizedBox(height: 13.0),
                        defaultTextFormField(
                          controller: confirmController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Confirm Password'.tr();
                            }
                          },
                          isPassword: RegisterCubit.get(context)
                              .isConfirmPasswordVisible,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changeConfirmPasswordVisibility();
                          },
                          label: 'Confirm Password'.tr(),
                          prefix: Icons.lock_outline,
                          suffix: RegisterCubit.get(context)
                              .confirmPasswordSuffix,
                        ),
                        SizedBox(height: 30.0),
                        state is RegisterLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFF0630B)),
                        )
                            : Container(
                          decoration: BoxDecoration(
                            color: AppCubit.get(context).isDark
                                ? HexColor('#F0630B')
                                : HexColor('#D8590A'),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  firstName: firstController.text,
                                  lastName: lastController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirm:
                                  confirmController.text,
                                  phoneNumber: numberController.text,
                                );
                              }
                            },
                            child: Text(
                              'Sign up'.tr(),
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 15.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: 130.0,
                        //       height: 1.0,
                        //       color: Colors.grey[600],
                        //     ),
                        //     Text('  OR  '.tr()),
                        //     Container(
                        //       width: 130.0,
                        //       height: 1.0,
                        //       color: Colors.grey[600],
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 15.0),
                        // Text(
                        //   'Continue with'.tr(),
                        //   style: TextStyle(
                        //     fontSize: 15.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: Image.asset(
                        //         'assets/images/g.png',
                        //         height: 20.0,
                        //         width: 20.0,
                        //       ),
                        //     ),
                        //     SizedBox(height: 20),
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(
                        //         Icons.facebook,
                        //         size: 25.0,
                        //         color: Colors.blue,
                        //       ),
                        //     ),
                        //     SizedBox(height: 20),
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(
                        //         Icons.apple,
                        //         size: 28.0,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'.tr()),
                            TextButton(
                              onPressed: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              child: Text(
                                'Sign in'.tr(),
                                style: TextStyle(
                                  color: HexColor('#F0630B'),
                                  fontFamily: 'font1',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
