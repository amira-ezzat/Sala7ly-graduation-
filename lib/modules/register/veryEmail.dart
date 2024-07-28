import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sala7ly/layout/layout_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../shared/cubit/cubit.dart';

class VerifyEmail extends StatefulWidget {
  final String email;

  VerifyEmail({required this.email});

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController pinController = TextEditingController();
  bool isVerifying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Image(
                image: AssetImage('assets/images/contact.png'),
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16),
              Text(
                'Check Your Email'.tr(),
                style: TextStyle(
                  fontFamily: 'font2',
                  fontSize: 22.0,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: PinCodeTextField(
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
                    activeFillColor: HexColor('#F0630B'),
                    inactiveFillColor: HexColor('#F0630B'),
                    selectedFillColor: HexColor('#F0630B'),
                    activeColor: HexColor('#F0630B'),
                    inactiveColor: HexColor('#F0630B'),
                    selectedColor: HexColor('#F0630B'),
                  ),
                  cursorColor: Colors.white,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: pinController,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
             // SizedBox(height: 22),
             //  Text(
             //    'Don’t receive the code'.tr(),
             //    style: TextStyle(
             //      fontSize: 16.0,
             //      fontFamily: 'font2',
             //    ),
             //  ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t receive the code'.tr(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'font2',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle resend code action
                    },
                    child: Text(
                      'RESEND'.tr(),
                      style: TextStyle(
                        color: HexColor('#F0630B'),
                        fontFamily: 'font1',
                      ),
                    ),
                  ),
                  Text(
                    'Code',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              ConditionalBuilder(
                condition: !isVerifying,
                builder: (context) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).isDark ? HexColor('#F0630B') : HexColor('#D8590A'),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _verifyCode(context, pinController.text);
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
                fallback: (context) => CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F0630B')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyCode(BuildContext context, String code) async {
    setState(() {
      isVerifying = true;
    });

    try {
      final response = await Dio().post(
        'https://sala7ly.vercel.app/userAuth/verifyemail',
        data: {
          'email': widget.email,
          'activateCode': code,
        },
      );

      // Check if the widget is still mounted before accessing ScaffoldMessenger
      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = response.data;
        final userToken = data['userToken']; // Get the actual userToken

        // Save userToken for future use, such as in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', userToken);

        // Navigate to the next screen with the received userToken
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Layout(userToken: userToken)),
        );

        // Show success message using ScaffoldMessenger
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account verified successfully').tr(),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Show error message using ScaffoldMessenger
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification failed: ${response.data['msg']}').tr(),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error verifying code: $e');
      // Show generic error message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred. Please try again.').tr(),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isVerifying = false;
      });
    }
  }
}
