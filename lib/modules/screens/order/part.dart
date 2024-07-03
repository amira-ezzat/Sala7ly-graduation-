import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../order_parts/modelParts.dart';

class OrderParts extends StatefulWidget {
  final List<Parts> ordersList;

  const OrderParts({Key? key, required this.ordersList}) : super(key: key);

  @override
  _OrderPartsState createState() => _OrderPartsState();
}

class _OrderPartsState extends State<OrderParts> {
  void _deleteOrder(int index) {
    setState(() {
      widget.ordersList.removeAt(index);
    });

    // Refresh the UI after removing the order
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order deleted'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Order'.tr(),
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
                          'Name'.tr(),
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
                          'Quantity'.tr(),
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
                          'Total'.tr(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.ordersList.length,
                    itemBuilder: (context, index) {
                      final order = widget.ordersList[index];
                      return Column(
                        children: [
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  order.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  order.name.tr(),
                                  style: TextStyle(color: Colors.grey[900], fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${order.quantity}',
                                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${(order.price * order.quantity).toStringAsFixed(2)} EG',
                                  style: TextStyle(color: Colors.grey[900], fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton(
                              onPressed: () {
                                _deleteOrder(index); // Call delete function
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
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
