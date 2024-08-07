import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../layout/layout_screen.dart';
import '../../../../shared/componants/navegate.dart';
import '../../../../shared/cubit/cubit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../formOrder.dart';
import 'modelParts.dart';

class OrderParts extends StatefulWidget {
  final String userToken;


  OrderParts({required this.userToken});
  @override
  _OrderPartsState createState() => _OrderPartsState();
}

class _OrderPartsState extends State<OrderParts> {
  List<SparePart> spareParts = [];
  List<SparePart> filteredParts = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSpareParts();
    searchController.addListener(_filterParts);
  }

  Future<List<SparePart>> fetchSpareParts() async {
    final response = await http.get(Uri.parse('https://sala7ly.vercel.app/spare?size=30'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> sparesJson = data['spare'];

      return sparesJson.map((json) => SparePart.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load spare parts');
    }
  }

  Future<void> _loadSpareParts() async {
    try {
      final parts = await fetchSpareParts();
      setState(() {
        spareParts = parts;
        filteredParts = parts;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching spare parts: $error');
    }
  }

  void _filterParts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredParts = spareParts.where((part) {
        return part.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _searchSpareParts(String query) async {
    if (query.isEmpty) {
      setState(() {
        filteredParts = spareParts;
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse('https://sala7ly.vercel.app/spare/search?title=$query'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> sparesJson = data['service'];

        setState(() {
          filteredParts = sparesJson.map((json) => SparePart.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to search spare parts');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error searching spare parts: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateTo(context, Layout(userToken: '',));
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        title: Text(
          'Spare Parts'.tr(),
          style: TextStyle(
            fontFamily: 'font1',
            color: HexColor('#F0630B'),
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: HexColor('#F0630B')),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppCubit.get(context).isDark ? Colors.grey[200] : Colors.grey[700],
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    _searchSpareParts(value); // استدعاء دالة البحث عند تغيير النص
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: isLoading
                  ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F0630B')),
                ),
              )
                  : ListView.separated(
                itemCount: filteredParts.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  thickness: 1.0,
                  indent: 20.0,
                  endIndent: 20.0,
                ),
                itemBuilder: (context, index) {
                  final part = filteredParts[index];
                  return ListTile(
                    leading: Image.network(
                      part.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      part.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          '${part.basePrice.toStringAsFixed(2)} EG',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          ' ${part.appliedPrice.toStringAsFixed(2)} EG',
                          style: TextStyle(
                            color: HexColor('#F0630B'),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        print('Spare Part ID: ${part.id}');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                constraints: BoxConstraints(
                                  minHeight: 300.0, // الحد الأدنى للارتفاع
                                  maxHeight: 550.0, // الحد الأقصى للارتفاع
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Enter Your Details'.tr(),
                                      style: TextStyle(
                                        color: Color(0xFFF0630B),
                                        fontSize: 25,
                                        fontFamily: 'font1',
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            FormOrder(spareId: part.id, userToken: widget.userToken,),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#F0630B'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
