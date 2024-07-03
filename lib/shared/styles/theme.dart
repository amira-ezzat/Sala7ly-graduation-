import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  dialogTheme: DialogTheme(
    backgroundColor:  Colors.grey[900],
  ),
  primaryColor: Color(0xFFF0630B),
  scaffoldBackgroundColor:
      Colors.grey[900],
  cardTheme: CardTheme(
    color: Color(0xFF303030)
  ),// Set the background color to black in dark mode
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color(0xFF303030),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(

      color: Colors.white,

    ),


  ),

timePickerTheme: TimePickerThemeData(
  backgroundColor: Color(0xFF2B2B32)
),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Color(0xFF2B2B32)
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor:Colors.grey[900],
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF303030),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    elevation: 20.0,
    color: Color(0xFF303030)
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[400]
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey[200], // Set text color to white in dark mode
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey[400],
    ),
    bodyMedium: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      )

  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Color(0xFF303030),

  ),
  fontFamily: 'font2',

);

ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xFFF0630B),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
  ),
  cardTheme: CardTheme(
      color: Colors.grey[700]
  ),//
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,

  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
        //color: Colors.black,
        ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    elevation: 20.0,
    color: Colors.white,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey[700],
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[900],
      )

  ),
  iconTheme: IconThemeData(
      color: Colors.grey[800]
  ),
  fontFamily: 'font2',
);
