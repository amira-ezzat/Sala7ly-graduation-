import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sala7ly/modules/screens/order/part.dart';
import 'package:sala7ly/modules/screens/order/server.dart';
import '../../../layout/layout_screen.dart';
import '../../../shared/componants/navegate.dart';
import '../order_parts/modelParts.dart';

class Orders extends StatefulWidget {
  //final List<Parts> ordersList; // تعريف ordersList كمعلمة هنا

 // Orders({Key? key, required this.ordersList}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool isArabicPressed = true;
  bool isEnglishPressed = false;

  void _showParts() {
    setState(() {
      isArabicPressed = true;
      isEnglishPressed = false;
    });
  }

  void _showServices() {
    setState(() {
      isArabicPressed = false;
      isEnglishPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            //navigateTo(context, Layout());
          },
        ),
        title: Text(
          'Orders'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _showParts,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return isArabicPressed ? Color(0xFFF0630B) : Colors.transparent;
                        },
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
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
                      'Parts'.tr(),
                      style: TextStyle(
                        color: isArabicPressed ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _showServices,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return isEnglishPressed ? Color(0xFFF0630B) : Colors.transparent;
                        },
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
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
                      'Services'.tr(),
                      style: TextStyle(
                        color: isEnglishPressed ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: isArabicPressed
                  ? OrderParts() // عرض قائمة الطلبات لشاشة القطع
                  : OrdersScreen(), // عنصر واجهة مستخدم بديل لشاشة الخدمات
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
