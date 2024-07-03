import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../layout/layout_screen.dart';

class PaySuccess extends StatefulWidget {
  @override
  State<PaySuccess> createState() => _PaySuccessState();
}

class _PaySuccessState extends State<PaySuccess> {
  bool isArabiclPressed = false;

  bool isEnglishPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(

            children: [
              SizedBox(height:77),
              Icon(Icons.check_circle_outline,
              size:188,color:Color(0xFFF0630B),),
              SizedBox(height:55),
              Text('Payment Completed Successful'.tr(),
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height:22),
              Text('Thanks for your order'.tr(),
                style: TextStyle(
                  color: Colors.grey,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height:33),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isArabiclPressed = true;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => Layout()),
                    );
                     // Close the dialog
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
                    'Back to Home'.tr(),
                    style: TextStyle(
                      color: isArabiclPressed ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    setState(() {
                      isEnglishPressed = true;
                    });
                // Show success SnackBar

                    // Navigate to OrdersScreen after confirming the order
                   // await Future.delayed(Duration(seconds: 2)); // Delay for Snackbar visibility
                    Navigator.pop(context);
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
                    'Track Order'.tr(),
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
        ),
      ),
    );
  }
}
