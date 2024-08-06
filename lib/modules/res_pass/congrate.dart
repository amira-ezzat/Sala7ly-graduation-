import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../layout/layout_screen.dart';

class CongrateScreen extends StatelessWidget {
  final String userToken;

  CongrateScreen({required this.userToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/11.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                "Congratulations",
                style: TextStyle(
                  color: HexColor('#F0630B'),
                  fontSize: 30,
                  fontFamily: 'font1',
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    "The Change process was \n          successful",
                    style: TextStyle(
                      fontFamily: 'font2',
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'please don’t forget the password again',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'font2',
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#D8590A'),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Layout(userToken: userToken,),
                      ),
                    );
                  },
                  child: Text(
                    'Start your Journey',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
