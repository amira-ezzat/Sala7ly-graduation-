import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  final CollectionReference ordersCollection =
  FirebaseFirestore.instance.collection('orders');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: ordersCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var orders = snapshot.data!.docs;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Problem'.tr(),
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
                          SizedBox(width: 66),
                          Expanded(
                            child: Text(
                              'Date'.tr(),
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
                          SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              'Time'.tr(),
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
                      Divider(height: 1, color: Colors.grey),
                      SizedBox(height: 20),
                      ...orders.map((order) {
                        var data = order.data() as Map<String, dynamic>;
                        return Column(
                          children: [

                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    data.containsKey('problem')
                                        ? data['problem']
                                        : 'N/A',
                                    style: TextStyle(
                                        color: Colors.grey[900], fontSize: 15),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    data.containsKey('date')
                                        ? data['date']
                                        : 'N/A',
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data.containsKey('time')
                                        ? data['time']
                                        : 'N/A',
                                    style: TextStyle(
                                        color: Colors.grey[900], fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                onPressed: () {
                                  _deleteOrder(context, order.id);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFF0630B)),
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
                                  'Delete'.tr(),
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
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _deleteOrder(BuildContext context, String orderId) async {
    try {
      await ordersCollection.doc(orderId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order deleted'.tr())),
      );
    } catch (e) {
      print('Error deleting order: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting order'.tr())),
      );
    }
  }
}
