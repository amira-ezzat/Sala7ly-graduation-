import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/Drawer/profil/profile.dart';
import '../../shared/componants/navegate.dart';
import '../../shared/componants/textFormField.dart';
import '../register/register.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Logged in successfully'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(userToken: state.userToken,), // Pass userToken
              ),
                  (Route<dynamic> route) => false,
            );
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login failed: ${state.error}'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            appBar: AppBar(

              ),

            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontFamily: 'font1',
                            fontSize: 30.0,
                            color: HexColor('#F0630B'),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        CircleAvatar(
                          radius: 70.0,
                          backgroundImage: AssetImage('assets/images/lo.jpg'),
                        ),
                        SizedBox(height: 50.0),
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
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password'.tr();
                            }
                          },
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          label: 'Password'.tr(),
                          prefix: Icons.lock_outline,
                          suffix: LoginCubit.get(context).suffix,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            onPressed: () {
                              // navigateAndFinish(context, ResetPage());
                            },
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                color: HexColor('#F0630B'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        if (state is! LoginLoadingState)
                          Container(
                            decoration: BoxDecoration(
                              color: HexColor('#F0630B'),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        else
                          Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F0630B')),
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
                        //     Text('  OR  '),
                        //     Container(
                        //       width: 130.0,
                        //       height: 1.0,
                        //       color: Colors.grey[600],
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 15.0),
                        // Text(
                        //   'Continue with',
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
                            Text('Don’t have an account ?'),
                            TextButton(
                              onPressed: () {
                                 navigateAndFinish(context, RegisterPage());
                              },
                              child: Text(
                                'Sign up',
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