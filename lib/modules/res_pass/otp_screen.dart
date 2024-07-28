import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sala7ly/modules/res_pass/new_password/newPass.dart';
import 'package:sala7ly/shared/componants/navegate.dart';
import 'package:http/http.dart' as http;
import '../../shared/cubit/cubit.dart';

class OtpScreen extends StatefulWidget {
  final String email;  // Add email parameter

  OtpScreen({required this.email});  // Accept email via constructor

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();
  bool isLoading = false;

  Future<void> verifyOtp(String otp) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://sala7ly.vercel.app/userAuth/verifycode'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': widget.email, 'resetCode': otp}),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200 && responseBody['statusCode'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Code verified successfully').tr(),
          backgroundColor: Colors.green,
        ),
      );
      navigateTo(context, NewPassword(email: widget.email));  // Pass email to NewPassword
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to verify code: ${responseBody['msg']}').tr(),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/otp.png'),
                width: 800,
                height: 220.0,
              ),
              Text(
                'OTP Verification'.tr(),
                style: TextStyle(
                  fontFamily: 'font1',
                  fontSize: 30.0,
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Text(
                      '          Enter OTP Send to  '.tr(),
                      style: TextStyle(fontSize: 16.0, fontFamily: 'font2'),
                    ),
                    Text(
                      '+000 000 000'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                textStyle: TextStyle(color: Colors.white),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 63,
                  fieldWidth: 63,
                  activeFillColor: Color(0xFFF0630B),
                  inactiveFillColor: Color(0xFFF0630B),
                  selectedFillColor: Color(0xFFF0630B),
                  activeColor: Color(0xFFF0630B),
                  inactiveColor: Color(0xFFF0630B),
                  selectedColor: Color(0xFFF0630B),
                ),
                cursorColor: Colors.white,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: pinController,
                onCompleted: (v) {
                  verifyOtp(v);
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t receive the OTP'.tr(),
                    style: TextStyle(fontSize: 16.0, fontFamily: 'font2'),
                  ),
                  Text(
                    'OTP'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'RESEND'.tr(),
                      style: TextStyle(
                        color: HexColor('#F0630B'),
                        fontFamily: 'font1',
                      ),
                    ),
                  ),
                  Text(
                    'OTP',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              ConditionalBuilder(
                condition: !isLoading,
                builder: (BuildContext context)=> Container(
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).isDark
                        ? HexColor('#F0630B')
                        : HexColor('#D8590A'),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      verifyOtp(pinController.text);
                    },
                    child: Text(
                      'Verify'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                fallback: (BuildContext context)=>Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF0630B)),
                    ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
