import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sala7ly/modules/res_pass/new_password/newPass.dart';
import 'package:sala7ly/shared/componants/navegate.dart';

import '../../shared/cubit/cubit.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  image:AssetImage('assets/images/otp.png',),
                width:800,
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
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'font2'
                      ),
                    ),
                    Text(
                      '+000 000 000'.tr(),
                      style: TextStyle(
                        fontWeight:FontWeight.w900,
                        fontSize:16.0,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height:20.0,
              ),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                textStyle: TextStyle(
                    color: Colors.white
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 63,
                  fieldWidth: 63,
                  activeFillColor: Color(0xFFF0630B),
                  inactiveFillColor:Color(0xFFF0630B),
                  selectedFillColor: Color(0xFFF0630B),
                  activeColor: Color(0xFFF0630B),
                  inactiveColor: Color(0xFFF0630B),
                  selectedColor:Color(0xFFF0630B),
                ),
                cursorColor: Colors.white, // لون المؤشر
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: pinController,
                onCompleted: (v) {
                  print("Completed: $v");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {});
                },
              ),
              SizedBox(
                height:20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t receive the OTP'.tr(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'font2'
                    ),
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
                      onPressed: (){},
                      child: Text(
                        'RESEND'.tr(),
                        style: TextStyle(
                          color: HexColor('#F0630B'),
                          fontFamily: 'font1'
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
                SizedBox(
                height: 50.0,
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
                    navigateTo(context, NewPasswoard());
                  },
                  child: Text(
                    'Verify'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color:Colors.white,
                    ),
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
