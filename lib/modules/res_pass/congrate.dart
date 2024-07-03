import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/layout/layout_screen.dart';
import 'package:sala7ly/shared/componants/navegate.dart';

import '../../shared/cubit/cubit.dart';
import '../screens/home/home_screen.dart';

class CongrateScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Padding(
                padding:  EdgeInsets.only(top: 50, bottom: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/11.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
               Text(
                "Congratulations".tr(),
                style: TextStyle(
                    color: HexColor('#F0630B'),
                    fontSize: 30,
                    fontFamily: 'font1'
                ),
              ),
               SizedBox(height: 20,),
               Column(
                children: [
                  Text(
                    "The Change process was \n          successful".tr(),
                      style:TextStyle(
                          fontFamily: 'font2',
                          fontSize: 16.0
                      ) ,
                  ),
                  // Text("successful", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text('please don’t forget the password again'.tr(),
                    style:TextStyle(
                      color:Colors.grey,
                      fontFamily: 'font2',
                      fontSize: 15.0
                    ) ,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
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
                   navigateAndFinish(context, Layout());
                  },
                  child: Text(
                    'Start your Journey'.tr(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      );

  }
}