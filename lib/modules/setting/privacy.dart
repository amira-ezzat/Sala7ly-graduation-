import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/componants/navegate.dart';
import 'ssettingss.dart';

class Privacy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            navigateTo(context, Settings());
          },
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('contact')
          ],
        ),
      ),
    );
  }
}
