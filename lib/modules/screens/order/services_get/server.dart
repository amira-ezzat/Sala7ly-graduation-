import 'dart:convert'; // تأكد من استيراد مكتبة `dart:convert`
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'package:sala7ly/modules/screens/order/services_get/model.dart';

class OrdersScreen extends StatefulWidget {
  final String userToken;
  OrdersScreen({required this.userToken});
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late Future<List<getOrder>> futureOrders;

  Future<List<getOrder>> fetchOrders() async {
    final response = await http.get(
      Uri.parse('https://sala7ly.vercel.app/service-order'),
      headers: {
        'accesstoken': widget.userToken,
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['statusCode'] == 200) {
        List<dynamic> ordersData = responseBody['orders'];
        return ordersData.map((order) => getOrder.fromJson(order)).toList();
      } else {
        throw Exception(responseBody['msg']);
      }
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<void> cancelOrder(String orderId) async {
    final response = await http.patch(
      Uri.parse('https://sala7ly.vercel.app/service-order/cancelById/$orderId'),
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
              content: Text('Order cancelled successfully'.tr())),
        );
        // إعادة تحميل الطلبات بعد إلغاء الطلب
        setState(() {
          futureOrders = fetchOrders();
        });
      } else {
        throw Exception(responseBody['msg']);
      }
    } else {
      throw Exception('Failed to cancel order');
    }
  }

  @override
  void initState() {
    super.initState();
    futureOrders = fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<getOrder>>(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F0630B')),
            ));
          }
          // else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // } 
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found'.tr()));
          }

          List<getOrder> orders = snapshot.data!;

          return Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Problem'.tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 66),
                    Expanded(
                      child: Text(
                        'Date'.tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        'Time'.tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        'Type'.tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  '${order.problemDesc}'.tr(),
                                  style: TextStyle(color: Colors.grey[900], fontSize: 15),
                                ),
                                SizedBox(width: 11,),
                                Text(
                                  '${order.orderDate}'.tr(),
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(width: 11,),
                                Text(
                                  '${order.orderTime}'.tr(),
                                  style: TextStyle(color: Colors.grey[900], fontSize: 15),
                                ),
                                SizedBox(width: 11,),
                                Text(
                                  ' ${order.orderType}'.tr(),
                                  style: TextStyle(color: Colors.grey[900], fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton(
                              onPressed: () {
                                // إلغاء الطلب عند الضغط على الزر
                                cancelOrder(order.id); // Use the order id here
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0xFFF0630B)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
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
          );
        },
      ),
    );
  }
}
