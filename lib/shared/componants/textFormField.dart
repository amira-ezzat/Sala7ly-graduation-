import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,

  required String? Function(String?)? validate,

  bool isPassword = false,
  bool iscPassword = false,
  bool isClackable = true,
  required String label,
   IconData? prefix,
  IconData? suffix,
  //conData?suffix,
  VoidCallback? suffixPressed,
 // VoidCallback? suffixPressed,
}) =>
    SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        cursorColor: Colors.grey.shade500,
        obscureText: isPassword,
        onFieldSubmitted: (String? s) {
          onSubmit?.call(s!);
        },
        onTap: () {
          onTap?.call();
        },
        onChanged: (String? s) {
          onChange?.call(s!);
        },
        validator: validate,
        enabled: isClackable,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[400],fontFamily: 'font4',fontSize: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            borderRadius: BorderRadius.circular(7.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(7.0),
          ),
          prefixIcon: Icon(prefix,color: Colors.grey,),
          contentPadding:  EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
          suffixIcon: suffix != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix),color: Colors.grey,)
              : null, // Wrap the prefix in an Icon widget
        ),
      ),
    );
