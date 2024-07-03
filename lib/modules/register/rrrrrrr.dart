// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:sala7ly/modules/Drawer/profil/edit_profile.dart';
//
// import 'manage.dart';
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   Color editProfileBorderColor = Colors.grey.shade800; // For Edit Profile button
//   Color numberBorderColor = Colors.grey.shade800; // For Number button
//   Color emailBorderColor = Colors.grey.shade800; // For Email button
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'My Profile'.tr(),
//           style: TextStyle(
//             color: Color(0xFFF0630B),
//             fontSize: 25,
//             fontFamily: 'font1',
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Consumer<ImageProviderNotifier>(
//                 builder: (context, imageProvider, child) {
//                   return Container(
//                     height: 200,
//                     child: Stack(
//                       alignment: AlignmentDirectional.bottomCenter,
//                       children: [
//                         Align(
//                           alignment: AlignmentDirectional.topCenter,
//                           child: Container(
//                             height: 160.0,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               image: DecorationImage(
//                                 image: imageProvider.coverImage,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         CircleAvatar(
//                           radius: 64.0,
//                           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//                           child: CircleAvatar(
//                             radius: 60.0,
//                             backgroundImage: imageProvider.profileImage,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 15.0),
//               Text(
//                 'Amira Ezzat'.tr(),
//                 style: TextStyle(
//                   fontFamily: 'font1',
//                   fontSize: 22,
//                 ),
//               ),
//               SizedBox(height: 40),
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EditProfile()),
//                     );
//                   },
//                   onTapDown: (_) {
//                     setState(() {
//                       editProfileBorderColor = Color(0xFFF0630B); // Change color here
//                     });
//                   },
//                   onTapUp: (_) {
//                     setState(() {
//                       editProfileBorderColor = Colors.grey.shade800;
//                     });
//                   },
//                   onTapCancel: () {
//                     setState(() {
//                       editProfileBorderColor = Colors.grey.shade800;
//                     });
//                   },
//                   child: Container(
//                     width: 360,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: editProfileBorderColor, // Use the specific borderColor variable
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(width: 5),
//                         SvgPicture.asset(
//                           'assets/image/acc.svg',
//                           color: Colors.grey,
//                           width: 24,
//                           height: 24,
//                         ),
//                         SizedBox(width: 12.0),
//                         Text(
//                           'Edit Profile'.tr(),
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         Spacer(),
//                         Icon(Icons.arrow_forward_ios),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: GestureDetector(
//                   onTap: () {
//                     // Handle Number button tap
//                   },
//                   onTapDown: (_) {
//                     setState(() {
//                       numberBorderColor = Colors.grey.shade800; // Reset color
//                     });
//                   },
//                   onTapUp: (_) {
//                     setState(() {
//                       numberBorderColor = Colors.grey.shade800;
//                     });
//                   },
//                   onTapCancel: () {
//                     setState(() {
//                       numberBorderColor = Colors.grey.shade800;
//                     });
//                   },
//                   child: Container(
//                     width: 360,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: numberBorderColor,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(width: 5),
//                         SvgPicture.asset(
//                           'assets/image/hash.svg',
//                           color: Colors.grey,
//                           width: 24,
//                           height: 24,
//                         ),
//                         SizedBox(width: 12.0),
//                         Text(
//                           'Number'.tr(),
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: GestureDetector(
//                   onTap: () {
//                     // Handle Email button tap
//                   },
//                   onTapDown: (_) {
//                     setState(() {
//                       emailBorderColor = Color(0xFFF0630B); // Reset color
//                     });
//                   },
//                   onTapUp: (_) {
//                     setState(() {
//                       emailBorderColor = Colors.grey.shade800;
//                     });
//                   },
//                   onTapCancel: () {
//                     setState(() {
//                       emailBorderColor = Colors.grey.shade800;
//                     });
//                   },
//                   child: Container(
//                     width: 360,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: emailBorderColor,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(width: 5),
//                         Icon(Icons.email_outlined, color: Colors.grey),
//                         SizedBox(width: 12.0),
//                         Text(
//                           'Email'.tr(),
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ************************************************
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:image_picker/image_picker.dart';
// import 'manage.dart';
//
// class EditProfile extends StatefulWidget {
//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   var emailController = TextEditingController();
//   var firstController = TextEditingController();
//   var lastController = TextEditingController();
//
//   Uint8List? _coverImage;
//   Uint8List? _profileImage;
//
//   void selectImage(bool isCover) async {
//     Uint8List img = await pickImage(ImageSource.gallery);
//     setState(() {
//       if (isCover) {
//         _coverImage = img;
//       } else {
//         _profileImage = img;
//       }
//     });
//   }
//
//   Future<Uint8List> pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null) {
//       return await pickedFile.readAsBytes();
//     }
//     throw Exception('No image selected');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final imageProvider = Provider.of<ImageProviderNotifier>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Edit Profile'.tr(),
//           style: TextStyle(
//             color: Color(0xFFF0630B),
//             fontSize: 25,
//             fontFamily: 'font1',
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Container(
//                 height: 200,
//                 child: Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: [
//                     Stack(
//                       alignment: AlignmentDirectional.topEnd,
//                       children: [
//                         Align(
//                           alignment: AlignmentDirectional.topCenter,
//                           child: Container(
//                             height: 154.0,
//                             width: 340,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(13.0),
//                               image: DecorationImage(
//                                 image: _coverImage != null
//                                     ? MemoryImage(_coverImage!)
//                                     : imageProvider.coverImage,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () => selectImage(true),
//                           icon: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 11.0,
//                             child: Icon(
//                               Icons.camera_alt,
//                               color: Colors.black,
//                               size: 11,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Stack(
//                       alignment: AlignmentDirectional.bottomEnd,
//                       children: [
//                         CircleAvatar(
//                           radius: 64.0,
//                           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//                           child: CircleAvatar(
//                             radius: 60.0,
//                             backgroundImage: _profileImage != null
//                                 ? MemoryImage(_profileImage!)
//                                 : imageProvider.profileImage,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () => selectImage(false),
//                           icon: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 11.0,
//                             child: Icon(
//                               Icons.camera_alt,
//                               color: Colors.black,
//                               size: 11,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30.0),
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: Text(
//                   '  First Name'.tr(),
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color: Colors.grey.shade500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 child: TextFormField(
//                   controller: firstController,
//                   keyboardType: TextInputType.emailAddress,
//                   cursorColor: Colors.grey.shade500,
//                   decoration: InputDecoration(
//                     labelStyle: TextStyle(
//                       fontFamily: 'font4',
//                       color: Colors.grey.shade400,
//                       fontSize: 16,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(7.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(7.0),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 11.0),
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: Text(
//                   '  Last Name'.tr(),
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color: Colors.grey.shade500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 child: TextFormField(
//                   controller: lastController,
//                   keyboardType: TextInputType.emailAddress,
//                   cursorColor: Colors.grey.shade500,
//                   decoration: InputDecoration(
//                     labelStyle: TextStyle(
//                       fontFamily: 'font4',
//                       color: Colors.grey.shade400,
//                       fontSize: 16,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(7.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(7.0),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 11.0),
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: Text(
//                   '  Email Or Mobile Number'.tr(),
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color: Colors.grey.shade500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 child: TextFormField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   cursorColor: Colors.grey.shade500,
//                   decoration: InputDecoration(
//                     labelStyle: TextStyle(
//                       fontFamily: 'font4',
//                       color: Colors.grey.shade400,
//                       fontSize: 16,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(7.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(7.0),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40.0),
//               Container(
//                 decoration: BoxDecoration(
//                   color: HexColor('#D8590A'),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(7.0),
//                   ),
//                 ),
//                 width: double.infinity,
//                 child: TextButton(
//                   onPressed: () {
//                     if (_coverImage != null) {
//                       imageProvider.setCoverImage(MemoryImage(_coverImage!));
//                     }
//                     if (_profileImage != null) {
//                       imageProvider.setProfileImage(MemoryImage(_profileImage!));
//                     }
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     'Save & Update'.tr(),
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontFamily: 'font1',
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
