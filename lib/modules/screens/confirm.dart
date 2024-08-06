//... الكود السابق

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../layout/layout_screen.dart';
import '../../shared/componants/navegate.dart';
import 'order_services/model.dart';
import 'order_services/order_services.dart';

class Confirm extends StatefulWidget {
  final Order order;
  final String userToken;

  Confirm({required this.order, required this.userToken});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  bool isPressed = false;
  bool isArabiclPressed = false;
  bool isEnglishPressed = false;
  Future<void> submitOrder() async {
    final order = widget.order;

    // التحقق من صحة جميع الحقول
    if (order.serviceId.isEmpty ||
        order.shippingAddress.isEmpty ||
        order.problemDesc.isEmpty ||
        order.orderDate.isEmpty ||
        order.orderTime.isEmpty ||
        order.orderType.isEmpty ||
        order.phoneNumber.isEmpty) {
      // عرض رسالة خطأ للمستخدم
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'.tr()),
        ),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('https://sala7ly.vercel.app/service-order'),
      headers: {
        'Content-Type': 'application/json',
        'accesstoken': widget.userToken,
      },
      body: json.encode(order.toJson()),
    );

    if (response.statusCode == 201) {
      // Successfully submitted the order
      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          content: Text('Your order has been successfully submitted.'.tr()),
          backgroundColor: Colors.green,
        ),
      );


       navigateAndFinish(context, Layout(userToken: '',));
    } else {
      // في حالة الفشل
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit the order. Please try again.'.tr()),
        ),
      );
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
            mainAxisSize: MainAxisSize.min,
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
                        setState(() {
                          // Add a variable to track whether the button is pressed
                          isArabiclPressed = true;
                        });
                        //navigateAndFinish(context, OrdServices());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            // Change the background color based on the button state
                            return isArabiclPressed ?  Color(0xFFF0630B) : Colors.transparent;
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
                          color: isArabiclPressed ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          // Add a variable to track whether the button is pressed
                          isEnglishPressed = true;

                        });
                        submitOrder();
                        // navigateAndFinish(context, Layout());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            // Change the background color based on the button state
                            return isEnglishPressed ?  Color(0xFFF0630B) : Colors.transparent;
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
                          color: isEnglishPressed ? Colors.white : Colors.black,
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
