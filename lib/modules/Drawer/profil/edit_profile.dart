import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/Drawer/profil/profile.dart';
import 'package:sala7ly/shared/componants/navegate.dart';

import '../../../shared/cubit/cubit.dart';
import '../../../shared/styles/icon.dart';

class EditeProfile extends StatelessWidget {
  var emailController = TextEditingController();
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon:Icon(Icons.arrow_back_ios),
          onPressed: () {
            //navigateTo(context, ProfileScreen());
          },),
        title:Text(
          'Edit Profile'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child:Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 64.0,
                          backgroundColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage:AssetImage('assets/images/moana.png'),
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 11.0,
                            child: Icon(
                              IconBroken.Camera,
                              color: Colors.black,
                              size: 11,
                            ),
                          ),
                        ),
                      ],
                    ),

              ),
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  First Name'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 16
                  ),
                ),
              ),
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // labelText: 'First Name',
                    labelStyle: TextStyle(
                        fontFamily: 'font4'
                        ,color: Colors.grey.shade400,
                        fontSize: 16
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15)
                ),

              ),
              SizedBox(
                height: 11.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Last Name'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 16
                  ),
                ),
              ),
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // labelText: 'First Name',
                    labelStyle: TextStyle(
                        fontFamily: 'font4'
                        ,color: Colors.grey
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15)
                ),

              ),
              SizedBox(
                height: 11.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Email Or Mobile Number'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 16
                  ),
                ),
              ),
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // labelText: 'First Name',
                    labelStyle: TextStyle(
                        fontFamily: 'font4'
                        ,color: Colors.grey
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15)
                ),

              ),
              SizedBox(
                height: 40.0,
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

                  },
                  child: Text(
                    'Save & Update'.tr(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'font1',
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
    );
  }
}