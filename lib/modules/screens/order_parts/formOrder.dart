import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../shared/componants/textFormField.dart';

class FormOrder extends StatefulWidget {
  final String spareId;
  final String userToken;

  FormOrder({required this.spareId, required this.userToken});

  @override
  _FormOrderState createState() => _FormOrderState();
}

class _FormOrderState extends State<FormOrder> {
  var numberController = TextEditingController();
  var addressController = TextEditingController();
  var quanController = TextEditingController();
  bool isCashSelected = true;

  void _submitOrder() async {
    String paymentMethod = isCashSelected ? 'Cash' : 'Credit';

    Map<String, dynamic> orderData = {
      "spareId": widget.spareId, // تأكد من تعيين المعرف الصحيح
      "shippingAddress": addressController.text,
      "phoneNumber": numberController.text,
      "paymentMethod": paymentMethod,
      "quantity": int.parse(quanController.text),
    };

    // طباعة بيانات الطلب للتحقق
    print('Order Data: $orderData');

    try {
      var response = await http.post(
        Uri.parse('https://sala7ly.vercel.app/spare-order'),
        headers: {
          'Content-Type': 'application/json',
          'accesstoken': widget.userToken,
        },
        body: jsonEncode(orderData),
      );

      // طباعة حالة الاستجابة والجسم المستلم
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        // النجاح
        print("Order created successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your order has been successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // فشل
        print("Failed to create order");
        print('Error: ${response.reasonPhrase}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create order: ${response.reasonPhrase}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // في حالة حدوث خطأ، يمكن طباعة الرسالة لتشخيص المشكلة
      print('Exception caught: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            defaultTextFormField(
              controller: addressController,
              type: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Address'.tr();
                }
                return null;
              },
              label: 'Your Address'.tr(),
              prefix: Icons.home_work_outlined,
            ),
            SizedBox(height: 20),
            defaultTextFormField(
              controller: numberController,
              type: TextInputType.number,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Phone Number'.tr();
                }
                return null;
              },
              label: 'Phone Number'.tr(),
              prefix: Icons.phone,
            ),
            SizedBox(height: 20),
            Align(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isCashSelected = !isCashSelected;
                  });
                },
                child: Container(
                  width: 376,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCashSelected = true;
                          });
                        },
                        icon: Icon(
                          isCashSelected
                              ? Icons.circle_rounded
                              : Icons.circle_outlined,
                          color: isCashSelected
                              ? Color(0xFFF0630B)
                              : Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Cash'.tr(),
                        style: TextStyle(
                          fontFamily: 'font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 55),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCashSelected = false;
                          });
                        },
                        icon: Icon(
                          isCashSelected
                              ? Icons.circle_outlined
                              : Icons.circle_rounded,
                          color: isCashSelected
                              ? Colors.grey[600]
                              : Color(0xFFF0630B),
                        ),
                      ),
                      Text(
                        'Credit'.tr(),
                        style: TextStyle(
                          fontFamily: 'font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            defaultTextFormField(
              controller: quanController,
              type: TextInputType.number,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter the Quantity'.tr();
                }
                return null;
              },
              label: 'Quantity'.tr(),
              prefix: Icons.format_list_numbered,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _submitOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF0630B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Submit'.tr(),
                style: TextStyle(
                  fontFamily: 'font1',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
