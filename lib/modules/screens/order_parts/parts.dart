import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sala7ly/modules/screens/order/part.dart';
import 'package:sala7ly/modules/screens/order_parts/payment.dart';
import '../../../layout/layout_screen.dart';
import '../../../shared/componants/navegate.dart';
import '../../../shared/cubit/cubit.dart';
import '../order/order.dart';
import 'cubit.dart';
import 'modelParts.dart';

class PartsScreen extends StatefulWidget {
  final List<Parts> ordersList;

  PartsScreen({Key? key, required this.ordersList}) : super(key: key);

  @override
  _PartsScreenState createState() => _PartsScreenState();
}

class _PartsScreenState extends State<PartsScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isArabicPressed = false;

  @override
  void initState() {
    super.initState();
    context.read<PartsBloc>().fetchProducts(); // Fetch products when screen initializes
  }

  void _addOrder(Parts parts) {
    setState(() {
      widget.ordersList.add(parts);
    });
    navigateTo(context, Orders(ordersList: widget.ordersList,)); // تمرير الطلبات إلى شاشة الأوامر
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pair Parts'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
        leading: IconButton(
          onPressed: () {
          //  navigateTo(context, Layout());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<PartsBloc, List<Parts>>(
        builder: (context, partsList) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: AppCubit.get(context).isDark ? Colors.grey[200] : Colors.grey[700],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: TextField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '  Search'.tr(),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Order'.tr(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Name'.tr(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Quantity'.tr(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Total'.tr(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1, color: Colors.grey),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: partsList.length,
                    itemBuilder: (context, index) {
                      final parts = partsList[index];
                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white70,
                                  child: Image.network(
                                    parts.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      parts.name.tr(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      '${parts.price.toStringAsFixed(2)} EG'.tr(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      '${parts.total.toStringAsFixed(2)} EG'.tr(),
                                      style: TextStyle(color: Color(0xFFF0630B), fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.add, color: Color(0xFFF0630B)),
                                          onPressed: () {
                                            context.read<PartsBloc>().updateProductQuantity(parts.id, parts.quantity + 1);
                                          },
                                        ),
                                        Text('${parts.quantity.toString()}'),
                                        IconButton(
                                          icon: Icon(Icons.remove, color: Colors.grey[700]),
                                          onPressed: () {
                                            context.read<PartsBloc>().updateProductQuantity(parts.id, parts.quantity - 1);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text('${(parts.price * parts.quantity).toStringAsFixed(2)} EG'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton(
                              onPressed: () {
                                _addOrder(parts);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => Payment(),
                                ),
                                );
                              }, // Send button action
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
                                'Send'.tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
