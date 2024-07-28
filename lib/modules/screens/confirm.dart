import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../layout/layout_screen.dart';

class Confirm extends StatefulWidget {
  final String phoneNumber;
  final String address;
  final String date;
  final String time;
  final String problem;
  final bool isTypeSelected;
  final bool isCashSelected;

  Confirm({
    required this.phoneNumber,
    required this.address,
    required this.date,
    required this.time,
    required this.problem,
    required this.isTypeSelected,
    required this.isCashSelected,
  });

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  bool isPressed = false;

  Future<void> _createOrder() async {
    final url = 'https://sala7ly.vercel.app/service-order';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "shippingAddress": widget.address,
      "problemDesc": widget.problem,
      "orderDate": widget.date,
      "orderTime": widget.time,
      "orderType": widget.isTypeSelected ? "Normal" : "Emergency",
      "phoneNumber": widget.phoneNumber,
    });

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: body);
      final responseData = json.decode(response.body);

      if (response.statusCode == 201) {
        print('Order created successfully: ${responseData['msg']}');
       // navigateAndFinish(context, Layout()); // Navigate to the layout or orders screen
      } else {
        print('Failed to create order: ${responseData['msg']}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            children: [
              Text(
                'Are you sure you want to confirm the order?'.tr(),
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return isPressed ? Color(0xFFF0630B) : Colors.transparent;
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: Color(0xFFF0630B),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'Cancel'.tr(),
                        style: TextStyle(
                          color: isPressed ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isPressed = true;
                        });
                        _createOrder(); // Create order and handle API response
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return isPressed ? Color(0xFFF0630B) : Colors.transparent;
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: Color(0xFFF0630B),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'Yes'.tr(),
                        style: TextStyle(
                          color: isPressed ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
