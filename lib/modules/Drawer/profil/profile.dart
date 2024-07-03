import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../layout/layout_screen.dart';
import '../../../model/userModel.dart';
import '../../../shared/componants/navegate.dart';
import 'edit_profile.dart';
import 'manage.dart';

class ProfileScreen extends StatefulWidget {
  final Sala7lyUserModel userModel;

  ProfileScreen({required this.userModel});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color editProfileBorderColor = Colors.grey.shade800; // For Edit Profile button
  Color numberBorderColor = Colors.grey.shade800; // For Number button
  Color emailBorderColor = Colors.grey.shade800;
  var emailController = TextEditingController(); // For Email button

  @override
  void initState() {
    super.initState();
    // Initialize emailController with userModel email
    emailController.text = widget.userModel.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            navigateTo(context, Layout());
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
              Consumer<ImageProviderNotifier>(
                builder: (context, imageProvider, child) {
                  return Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            height: 160.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: imageProvider.coverImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 64.0,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: imageProvider.profileImage,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.userModel.firstName ?? 'Amira'.tr(),
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    widget.userModel.lastName ?? 'Ezzat'.tr(),
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  onTapDown: (_) {
                    setState(() {
                      editProfileBorderColor = Color(0xFFF0630B); // Change color here
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      editProfileBorderColor = Colors.grey.shade800;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      editProfileBorderColor = Colors.grey.shade800;
                    });
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: editProfileBorderColor, // Use the specific borderColor variable
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        SvgPicture.asset(
                          'assets/image/acc.svg',
                          color: Colors.grey,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          'Edit Profile'.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                        SizedBox(width: 5),
                        SvgPicture.asset(
                          'assets/image/hash.svg',
                          color: Colors.grey,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          widget.userModel.phone ?? '01123279544'.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                    // Handle Email button tap
                    setState(() {
                      widget.userModel.email = emailController.text; // Update userModel with new email
                    });
                  },
                  onTapDown: (_) {
                    setState(() {
                      emailBorderColor = Color(0xFFF0630B); // Change border color
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      emailBorderColor = Colors.grey.shade800; // Reset border color
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      emailBorderColor = Colors.grey.shade800; // Reset border color
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
                        SizedBox(width: 5),
                        Icon(Icons.email_outlined, color: Colors.grey),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email'.tr(),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            onSubmitted: (value) {
                              setState(() {
                                widget.userModel.email = value; // Update userModel with new email
                              });
                            },
                          ),
                        ),
                       // Icon(Icons.edit, color: Colors.grey),
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
