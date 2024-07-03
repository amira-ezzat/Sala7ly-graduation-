import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/icon.dart';

PreferredSizeWidget defualtAppBar({
  required BuildContext context,
  String? title,
  List<Widget>?actions,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon:Icon(IconBroken.Arrow___Left_2) ,

  ),
  title: Text(
    title!,
    style: TextStyle(
        color: HexColor('#67A3D9')
    ),
  ),
  actions: actions,
);