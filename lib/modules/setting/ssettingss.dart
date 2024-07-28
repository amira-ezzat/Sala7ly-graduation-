import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sala7ly/modules/Drawer/profil/profile.dart';
import 'package:sala7ly/modules/setting/about.dart';
import 'package:sala7ly/modules/setting/contact.dart';
import 'package:sala7ly/modules/setting/privacy.dart';
import 'package:sala7ly/modules/setting/terms.dart';
import 'package:sala7ly/modules/setting/language.dart';

import '../../layout/layout_screen.dart';
import '../../shared/componants/navegate.dart';
import '../../shared/cubit/cubit.dart';
import '../Drawer/profil/edit_profile.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color borderColor1 =  Colors.grey.shade800;
  Color borderColor2 = Colors.grey.shade800;
  Color borderColor3 = Colors.grey.shade800;
  Color borderColor4 = Colors.grey.shade800;
  Color borderColor5 = Colors.grey.shade800;
  Color borderColor6 = Colors.grey.shade800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            //navigateTo(context, Layout());
           // Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 60,),
              GestureDetector(
                onTap: () {
                 // navigateTo(context, ProfileScreen());
                  AppCubit.get(context).changeAppMode();
                },
                onTapDown: (_) {
                  setState(() {
                    borderColor1 = Color(0xFFF0630B);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderColor1 = Colors.grey.shade800;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    borderColor1 = Colors.grey.shade800;
                  });
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor1,
                      width: 2.0,
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
                        'assets/image/moon.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'Dark Mode'.tr(),
                       style: Theme.of(context).textTheme.bodyMedium,
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
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, Contact());
                },
                onTapDown: (_) {
                  setState(() {
                    borderColor2 = Color(0xFFF0630B);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderColor2 = Colors.grey.shade800;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    borderColor2 = Colors.grey.shade800;
                  });
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor2,
                      width: 2.0,
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
                        'assets/image/rm.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'Contact Us'.tr(),

                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                       // color: Colors.grey[800],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, About());
                },
                onTapDown: (_) {
                  setState(() {
                    borderColor3 = Color(0xFFF0630B);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderColor3 = Colors.grey.shade800;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    borderColor3 = Colors.grey.shade800;
                  });
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor3,
                      width: 2.0,
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
                        'assets/image/is.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'About Us'.tr(),
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
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
        
                  showDialog(
                    context: context,
                    builder: (context)=>const ShowDialogChangeLanguage(),
                  );
                },
                onTapDown: (_) {
                  setState(() {
                    borderColor4 = Color(0xFFF0630B);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderColor4 = Colors.grey.shade800;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    borderColor4 = Colors.grey.shade800;
                  });
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor4,
                      width: 2.0,
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
                        'assets/image/language.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'Language'.tr(),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                       // color: Colors.grey[800],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, Terms());
                },
                onTapDown: (_) {
                  setState(() {
                    borderColor5 = Color(0xFFF0630B);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderColor5 = Colors.grey.shade800;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    borderColor5 = Colors.grey.shade800;
                  });
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor5,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      ImageIcon(
                        AssetImage('assets/image/fi.png'),
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'Terms&Conditions'.tr(),
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
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, Privacy());
                },
                onTapDown: (_) {
                  setState(() {
                    borderColor6 = Color(0xFFF0630B);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderColor6 = Colors.grey.shade800;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    borderColor6 = Colors.grey.shade800;
                  });
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor6,
                      width: 2.0,
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
                        'assets/image/f.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'Privacy Policy'.tr(),

                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                      //  color: Colors.grey[800],
                      ),
                    ],
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
