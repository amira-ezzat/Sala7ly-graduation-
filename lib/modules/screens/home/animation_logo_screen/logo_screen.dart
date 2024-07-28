import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sala7ly/modules/onBoarding/boarding.dart';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            Image.asset('assets/images/1.png'),
            Spacer(),
            Text(
              'Masaft Elseka'.tr(),
            style: TextStyle(
            fontWeight: FontWeight.w500,
              fontFamily: 'ss',
              fontSize: 40,
              color: HexColor('#F0630B'),
            ),
            ),
          ],
        ),
      ),
      nextScreen: BoardingScreen(),
      splashIconSize: 450,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: HexColor('#FACFB3'),
      duration: 4000,
      
    );
  }
}
