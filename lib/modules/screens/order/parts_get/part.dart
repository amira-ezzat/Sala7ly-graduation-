import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../order_parts/parts/modelParts.dart';

class OrderParts extends StatefulWidget {
  final String userToken;
  OrderParts({required this.userToken});
  @override
  _OrderPartsState createState() => _OrderPartsState();
}

class _OrderPartsState extends State<OrderParts> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
