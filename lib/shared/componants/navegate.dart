import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          ( route)
      {
        return false;
      }
  );
}
