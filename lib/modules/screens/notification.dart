import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../layout/layout_screen.dart';
import '../../shared/componants/navegate.dart';

class Notificat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        actions: [

          SvgPicture.asset(
            'assets/image/bell-fill-24.svg',
            width: 24,
            height: 24,
            color: Colors.black,
          ),
          SizedBox(width: 22,),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            navigateTo(context, Layout());
            // Navigator.pop(context);
          },
        ),
        title: Text(
          'Notification'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 8,),
                Text(
                  'New'.tr(),
                  style:Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                Text(
                  'Clear All'.tr(),
                  style:Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(width: 8,),
              ],
            ),
            SizedBox(height: 3,),
            Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    child: Container(
                      // width: 370,
                      height: 70,
                      // decoration: BoxDecoration(
                        color: Color(0xFFFDE8DA),
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      // decoration: BoxDecoration(

                      //   border: Border.none,
                      //
                      // ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/o.png',
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'New Offers, Enjoy a 25% discount'.tr(),
                               // maxLines:2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'on your next purchase today'.tr(),
                               // maxLines:1,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    child: Container(
                      // width: 370,
                      height: 70,
                      // decoration: BoxDecoration(
                      color: Color(0xFFFDE8DA),
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      // decoration: BoxDecoration(

                      //   border: Border.none,
                      //
                      // ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/o.png',
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'New Offers, Enjoy a 25% discount'.tr(),
                                // maxLines:2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'on your next purchase today'.tr(),
                                // maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    child: Container(
                      // width: 370,
                      height: 70,
                      // decoration: BoxDecoration(
                      color: Color(0xFFFDE8DA),
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      // decoration: BoxDecoration(

                      //   border: Border.none,
                      //
                      // ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/o.png',
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'New Offers, Enjoy a 25% discount'.tr(),
                                // maxLines:2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'on your next purchase today'.tr(),
                                // maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    child: Container(
                      // width: 370,
                      height: 70,
                      // decoration: BoxDecoration(
                      color: Color(0xFFFDE8DA),
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      // decoration: BoxDecoration(

                      //   border: Border.none,
                      //
                      // ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/o.png',
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'New Offers, Enjoy a 25% discount'.tr(),
                                // maxLines:2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'on your next purchase today'.tr(),
                                // maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    child: Container(
                      // width: 370,
                      height: 70,
                      // decoration: BoxDecoration(
                      color: Color(0xFFFDE8DA),
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      // decoration: BoxDecoration(

                      //   border: Border.none,
                      //
                      // ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/o.png',
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'New Offers, Enjoy a 25% discount'.tr(),
                                // maxLines:2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'on your next purchase today'.tr(),
                                // maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:10),
            Row(
              children: [
                SizedBox(width: 8,),
                Text(
                  'Today'.tr(),
                  style:Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(height: 3,),
            SizedBox(height: 15,),
            Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(

                    child: Container(
                     // width: 370,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/or.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Thank you for your order Your order\nis now on the waiting list'.tr(),
                                //maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(

                    child: Container(
                      // width: 370,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/or.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Thank you for your order Your order\nis now on the waiting list'.tr(),
                                //maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(

                    child: Container(
                      // width: 370,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/or.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Thank you for your order Your order\nis now on the waiting list'.tr(),
                                //maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(

                    child: Container(
                      // width: 370,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/or.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Thank you for your order Your order\nis now on the waiting list'.tr(),
                                //maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(

                    child: Container(
                      // width: 370,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/or.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Thank you for your order Your order\nis now on the waiting list'.tr(),
                                //maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(

                    child: Container(
                      // width: 370,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor:  Color(0xFFF0630B),
                            radius: 20,
                            child:Image.asset('assets/images/or.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Thank you for your order Your order\nis now on the waiting list'.tr(),
                                //maxLines:1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }
}
