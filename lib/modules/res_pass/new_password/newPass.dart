import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/res_pass/congrate.dart';
import 'package:sala7ly/modules/res_pass/new_password/cubit/cubit.dart';
import 'package:sala7ly/modules/res_pass/new_password/cubit/state.dart';
import 'package:sala7ly/shared/componants/navegate.dart';

import '../../../shared/componants/textFormField.dart';
import '../../../shared/cubit/cubit.dart';

class NewPasswoard extends StatelessWidget {
var newController= TextEditingController();
var confirmController= TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>ResetCubit(),
      child: BlocConsumer<ResetCubit,ResetState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(

            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Create New Password".tr(),
                        style: TextStyle(
                            color:Color(0xFFF0630B),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'your new password must be different from\nprevious used password.'.tr(),
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      defaultTextFormField(
                        controller: newController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter New Password".tr();
                          }
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
                          child: Text('        must be at least 8 character'.tr(),
                            style: TextStyle(color: Colors.grey),)),
                      SizedBox(
                        height: 60.0,
                      ),
                      defaultTextFormField(
                        controller: confirmController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Confirm Password'.tr();
                          }
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
                          child: Text('        both password must match'.tr(),
                            style: TextStyle(color: Colors.grey),)),
                      SizedBox(
                        height: 100.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:AppCubit.get(context).isDark?  HexColor('#F0630B'):HexColor('#D8590A') ,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            if(formKey.currentState!.validate())
                            {

                            }
                            navigateTo(context, CongrateScreen());
                          },
                          child: Text(
                            'Create'.tr(),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
