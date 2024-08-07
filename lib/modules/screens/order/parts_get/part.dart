import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetParts extends StatefulWidget {
  final String userToken;
  GetParts({required this.userToken});

  @override
  _GetPartsState createState() => _GetPartsState();
}

class _GetPartsState extends State<GetParts> {
  List orders = [];
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    final response = await http.get(
      Uri.parse('https://sala7ly.vercel.app/spare-order'),
      headers: {
        'Content-Type': 'application/json',
        'accesstoken': widget.userToken,
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      if (responseData['statusCode'] == 200) {
        // استخدم البيانات من مفتاح 'orders'
        final ordersList = responseData['orders'];
        if (ordersList is List) {
          setState(() {
            orders = ordersList;
          });
        } else {
          print('Unexpected data format');
        }
      } else {
        print('Failed to fetch orders with message: ${responseData['msg']}');
      }
    } else {
      print('Failed to fetch orders');
    }
  }
  Future<void> cancelOrder(String orderId) async {
    final response = await http.patch(
      Uri.parse('https://sala7ly.vercel.app/spare-order/cancelById/$orderId'),
      headers: {
        'accesstoken': widget.userToken,
      },
    );

    print('Cancel response status: ${response.statusCode}');
    print('Cancel response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['statusCode'] == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Order cancelled successfully'.tr()),
          ),
        );
        // إعادة تحميل الطلبات بعد إلغاء الطلب
        fetchOrders(); // Call fetchOrders to refresh the data
      } else {
        throw Exception(responseBody['msg']);
      }
    } else {
      throw Exception('Failed to cancel order');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orders.isEmpty
          ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F0630B')),
          ))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Order'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 22),
                Expanded(
                  child: Text(
                    'Name'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 22),
                Expanded(
                  child: Text(
                    'Quantaty'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 22),
                Expanded(
                  child: Text(
                    'Total'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                var order = orders[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Text('${order['orderItems'][0]['title']}')),
                          Expanded(child: SizedBox(width: 8)),
                          Expanded(child: Text('${order['orderItems'][0]['quantity']}')),
                         // SizedBox(width: 8),
                          Expanded(child: Text('${order['totalPrice']}')),
                        ],
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: () {
                            // إلغاء الطلب عند الضغط على الزر
                            cancelOrder(order['_id']); // Use the order id here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(
                                Color(0xFFF0630B)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(22.0),
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
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(height: 1, color: Colors.grey),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
