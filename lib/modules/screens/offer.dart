import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading:IconButton(
          icon:Icon(Icons.arrow_back_ios),
          onPressed: () {
            //navigateTo(context, Layout());
          },),
        title:Text(
          'Offers'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/1.png',
                    fit: BoxFit.cover, // Choose the appropriate BoxFit based on your design
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/2.jpg',
                    fit: BoxFit.cover, // Choose the appropriate BoxFit based on your design
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/1.png',
                    fit: BoxFit.cover, // Choose the appropriate BoxFit based on your design
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/2.jpg',
                    fit: BoxFit.cover, // Choose the appropriate BoxFit based on your design
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/1.png',
                    fit: BoxFit.cover, // Choose the appropriate BoxFit based on your design
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/2.jpg',
                    fit: BoxFit.cover, // Choose the appropriate BoxFit based on your design
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
