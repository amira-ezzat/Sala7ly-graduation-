
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sala7ly/layout/layout_screen.dart';
import 'package:sala7ly/modules/Drawer/profil/profile.dart';
import 'package:sala7ly/modules/screens/home/animation_logo_screen/logo_screen.dart';
import 'package:sala7ly/modules/setting/ssettingss.dart';
import '../../model/userModel.dart';
import '../../shared/componants/navegate.dart';
import '../../shared/cubit/cubit.dart';
class Draw extends StatefulWidget {
  @override
  State<Draw> createState() => _DrawState();
}
class _DrawState extends State<Draw> {
  Color borderColor1 = Colors.grey.shade500;
  Color borderColor2 = Colors.grey.shade500;
  Color borderColor3 = Colors.grey.shade500;
  bool isCancelPressed = false;
  bool isYesPressed = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 177,
            color:AppCubit.get(context).isDark?  HexColor('#FDE8DA'):Colors.grey[900] ,
            child: DrawerHeader(

              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 30.0,backgroundColor: HexColor('#FACFB3'),
                    backgroundImage:AssetImage('assets/images/1.png',)
                  ),
                  Text(
                    'Sala7ly'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Magical',
                      fontSize: 32,
                      color: HexColor('#F0630B'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 52,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                final userModel = Provider.of<Sala7lyUserModel>(context, listen: false); // أو من حيثما تحصل على userModel
                navigateTo(context, ProfileScreen(userModel: userModel));


              },
              onTapDown: (_) {
                setState(() {
                  borderColor1 = Color(0xFFF0630B);
                });
              },
              onTapUp: (_) {
                setState(() {
                  borderColor1 = Colors.grey.shade500;
                });
              },
              onTapCancel: () {
                setState(() {
                  borderColor1 = Colors.grey.shade500;
                });
              },
              child: Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor1,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/image/acc.svg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'My Profile'.tr(),
                      style:Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      //color: Colors.grey[800],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                navigateTo(context, Settings());
              },
              onTapDown: (_) {
                setState(() {
                  borderColor2 = Color(0xFFF0630B);
                });
              },
              onTapUp: (_) {
                setState(() {
                  borderColor2 = Colors.grey.shade500;
                });
              },
              onTapCancel: () {
                setState(() {
                  borderColor2 = Colors.grey.shade500;
                });
              },
              child: Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor2,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/image/stt.svg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Settings'.tr(),
                      style:Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                    // color: Theme.of(context).iconTheme.color,
                     // color: Colors.grey[800],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {

                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  //backgroundColor: Colors.white, // <-- Background color
                  builder: (context) {
                    return SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children:  <Widget>[
                          Center(
                            child: Text(
                              'Log Out'.tr(),
                              style: TextStyle(
                                  color: Color(0xFFF0630B),
                                  fontSize: 28,
                                  // fontFamily: 'font1',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              'Are your sure you want to log out?'.tr(),
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        // Add a variable to track whether the button is pressed
                                        isCancelPressed = true;
                                      });
                                      navigateAndFinish(context, Layout());
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          // Change the background color based on the button state
                                          return isCancelPressed ?  Color(0xFFF0630B) : Colors.transparent;
                                        },
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      side: MaterialStateProperty.all(
                                        BorderSide(
                                          color: Color(0xFFF0630B),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Cancel'.tr(),
                                      style: TextStyle(
                                        color: isCancelPressed ? Colors.white : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        // Add a variable to track whether the button is pressed
                                        isYesPressed = true;
                                      });
                                      navigateAndFinish(context, LogoScreen());
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          // Change the background color based on the button state
                                          return isYesPressed ?  Color(0xFFF0630B) : Colors.transparent;
                                        },
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      side: MaterialStateProperty.all(
                                        BorderSide(
                                          color: Color(0xFFF0630B),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Yes'.tr(),
                                      style: TextStyle(
                                        color: isYesPressed ? Colors.white : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              onTapDown: (_) {
                setState(() {
                  borderColor3 = Color(0xFFF0630B);
                });
              },
              onTapUp: (_) {
                setState(() {
                  borderColor3 = Colors.grey.shade500;
                });
              },
              onTapCancel: () {
                setState(() {
                  borderColor3 = Colors.grey.shade500;
                });
              },
              child: Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor3,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/image/out.svg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Log Out'.tr(),
                      style:Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      //color: Colors.grey[800],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}