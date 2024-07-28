import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/res_pass/otp_screen.dart';
import 'package:sala7ly/shared/componants/navegate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../shared/cubit/cubit.dart';
import 'congrate.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  var formKey = GlobalKey<FormState>();
  var restController = TextEditingController();
  bool _isLoading = false;

  Future<void> sendOtpEmail(BuildContext context) async {
    final email = restController.text;

    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await http.post(
          Uri.parse('https://sala7ly.vercel.app/userAuth/forgetpassword'), // Double-check this URL
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email}),
        );

        final responseBody = jsonDecode(response.body);
        print('Response status: ${response.statusCode}');
        print('Response body: $responseBody');

        if (response.statusCode == 200 && responseBody['statusCode'] == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Email sent successfully').tr(),
              backgroundColor: Colors.green,
            ),
          );
          navigateTo(context, OtpScreen(email: email));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to send email: ${responseBody['msg']}').tr(),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print('Request failed with status: ${e}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e').tr(),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 33,),
                Text(
                  "Reset Password".tr(),
                  style: TextStyle(
                    color: Color(0xFFF0630B),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter the email associated with your account and we will send a 4-digit OTP with instructions to reset your password."
                      .tr(),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 44.0),
                // Text('Email'.tr()),
                // SizedBox(height: 5.0),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: restController,

                    cursorColor: Colors.grey.shade500,

                    decoration: InputDecoration(
                      hintText: 'Enter your Email'.tr(),
                      hintStyle: TextStyle(
                        fontFamily: 'font4',
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'You must enter your email'.tr();
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 188.0),
                _isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Color(0xFFF0630B)),
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).isDark
                        ? HexColor('#F0630B')
                        : HexColor('#D8590A'),
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => sendOtpEmail(context),
                    child: Text(
                      'Send OTP'.tr(),
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
  }
}
