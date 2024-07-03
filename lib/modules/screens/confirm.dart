import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../layout/layout_screen.dart';

class Confirm extends StatefulWidget {
  final String phoneNumber;
  final String address;
  final String date;
  final String time;
  final String problem;

  Confirm({
    required this.phoneNumber,
    required this.address,
    required this.date,
    required this.time,
    required this.problem,
  });

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  bool isArabiclPressed = false;
  bool isEnglishPressed = false;

  Future<void> _saveOrderToFirestore() async {
    await FirebaseFirestore.instance.collection('orders').add({
      'phoneNumber': widget.phoneNumber,
      'address': widget.address,
      'date': widget.date,
      'time': widget.time,
      'problem': widget.problem,
    });
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order sent successfully'.tr()),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
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
                'Are you sure you want to confirm order?'.tr(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isArabiclPressed = true;
                        });
                        Navigator.pop(context); // Close the dialog
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return isArabiclPressed ? Color(0xFFF0630B) : Colors.transparent;
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
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        setState(() {
                          isEnglishPressed = true;
                        });
                        await _saveOrderToFirestore(); // Save data to Firestore
                        _showSuccessSnackBar(context); // Show success SnackBar

                        // Navigate to OrdersScreen after confirming the order
                        await Future.delayed(Duration(seconds: 2)); // Delay for Snackbar visibility
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => Layout()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return isEnglishPressed ? Color(0xFFF0630B) : Colors.transparent;
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
