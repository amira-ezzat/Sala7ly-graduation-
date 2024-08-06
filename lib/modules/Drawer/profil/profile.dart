import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/layout/layout_screen.dart';
import 'package:sala7ly/modules/setting/ssettingss.dart';
import 'package:sala7ly/shared/componants/navegate.dart';
import 'package:http/http.dart' as http;
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  final String userToken;

  ProfileScreen({required this.userToken});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color editProfileBorderColor = Colors.grey.shade800; // For Edit Profile button
  Color numberBorderColor = Colors.grey.shade800; // For Number button
  Color emailBorderColor = Colors.grey.shade800; // For Email button
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    print('User Token: ${widget.userToken}');
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse('https://sala7ly.vercel.app/user/profiledata'),
        headers: {
          'accesstoken': widget.userToken,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Data received: $data');

        // تحقق من البيانات وتحديث الحالة
        if (data != null && data['getUser'] != null) {
          if (mounted) { // تحقق من أن الحالة لا تزال مركبة
            setState(() {
              firstName = data['getUser']['firstName'] ?? '';
              lastName = data['getUser']['lastName'] ?? '';
              email = data['getUser']['email'] ?? '';
              phoneNumber = data['getUser']['phoneNumber'] ?? '';
              print('Updated State: $firstName, $lastName, $email, $phoneNumber'); // تحقق من تحديث الحالة
            });
          }
        } else {
          print('No user data found in response');
        }
      } else {
        print('Failed to load profile data');
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
           // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Layout(userToken: widget.userToken,),
              ),
            );
          },
        ),
        title: Text(
          'My Profile'.tr(),
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
              Container(
                height: 150,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundColor:HexColor('#FACFB3'),
                        backgroundImage: AssetImage('assets/images/1.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$firstName'.tr(),
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '$lastName'.tr(),
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              // Align(
              //   alignment: AlignmentDirectional.topStart,
              //   child: GestureDetector(
              //     onTap: () {
              //       navigateTo(context, EditeProfile());
              //     },
              //     onTapDown: (_) {
              //       setState(() {
              //         editProfileBorderColor = Color(0xFFF0630B); // Change color here
              //       });
              //     },
              //     onTapUp: (_) {
              //       setState(() {
              //         editProfileBorderColor = Colors.grey.shade800;
              //       });
              //     },
              //     onTapCancel: () {
              //       setState(() {
              //         editProfileBorderColor = Colors.grey.shade800;
              //       });
              //     },
              //     child: Container(
              //       width: 360,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: editProfileBorderColor, // Use the specific borderColor variable
              //           width: 1.0,
              //         ),
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //             width: 5,
              //           ),
              //           SvgPicture.asset(
              //             'assets/image/acc.svg',
              //             color: Colors.grey,
              //             width: 24,
              //             height: 24,
              //           ),
              //           SizedBox(width: 12.0),
              //           Text(
              //             'Edit Profile'.tr(),
              //             style: Theme.of(context).textTheme.bodyMedium,
              //           ),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //             // color: Colors.grey[700],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                    // Handle Number button tap
                  },
                  onTapDown: (_) {
                    setState(() {
                      numberBorderColor = Colors.grey.shade800; // Reset color
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      numberBorderColor = Colors.grey.shade800;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      numberBorderColor = Colors.grey.shade800;
                    });
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: numberBorderColor,
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
                          'assets/image/hash.svg',
                          color: Colors.grey,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          '$phoneNumber'.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                    // Handle Email button tap
                  },
                  onTapDown: (_) {
                    setState(() {
                      emailBorderColor = Color(0xFFF0630B); // Reset color
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      emailBorderColor = Colors.grey.shade800;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      emailBorderColor = Colors.grey.shade800;
                    });
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: emailBorderColor,
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
                        Icon(Icons.email_outlined, color: Colors.grey),
                        SizedBox(width: 12.0),
                        Text(
                          '$email'.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                      ],
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
