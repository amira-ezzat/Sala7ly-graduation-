import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sala7ly/modules/screens/order_services/order_services.dart';
import 'package:sala7ly/modules/screens/serviceasfire/model.dart';
import 'package:sala7ly/shared/componants/navegate.dart';
import 'package:sala7ly/shared/cubit/cubit.dart';
import 'package:sala7ly/shared/cubit/state.dart';

import '../../../layout/layout_screen.dart';

class Services extends StatefulWidget {
  final String userToken;
  Services({required this.userToken});
  @override
  _ServicesState createState() => _ServicesState();
}

var searchController = TextEditingController();

class _ServicesState extends State<Services> {
  String pressedCardServiceName = '';
  List<Service> services = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  Future<void> fetchServices() async {
    final response = await http.get(Uri.parse('https://sala7ly.vercel.app/service?size=30'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> serviceList = data['service'];
      setState(() {
        services = serviceList.map((service) => Service.fromJson(service)).toList();
        isLoading = false;
      });
    } else {
      print('Failed to load services, status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> searchServices(String query) async {

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://sala7ly.vercel.app/service/search?title=$query');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('API Response: $data');

        final List<dynamic> servicesJson = data['service'];

        setState(() {
          services = servicesJson.map((json) => Service.fromJson(json)).toList();
        });
      } else {
        print('Failed to load services, status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            navigateTo(context, Layout(userToken:widget.userToken,));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F0630B')),
      ))
          : SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: 300,
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppCubit.get(context).isDark ? Colors.grey[200] : Colors.grey[700],
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.grey,
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      searchServices(query);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: '  Search'.tr(),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),


              SizedBox(height: 30,),
              ..._buildServiceCards(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildServiceCards() {
    List<Widget> cards = [];
    for (int i = 0; i < services.length; i += 3) {
      List<Service> chunk = services.sublist(i, (i + 3) > services.length ? services.length : i + 3);
      cards.add(
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: chunk.map((service) => buildCard(service.title, service.imageUrl, service.id)).toList(),
          ),
        ),
      );
    }
    return cards;
  }

  Widget buildCard(String serviceName, String imageUrl,String serviceId) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        bool isDarkMode = AppCubit.get(context).isDark;
        return Container(
          height: 120,
          width: 120,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: pressedCardServiceName == serviceName ? 0.0 : 2.0,
            margin: EdgeInsets.all(10.0),
            color: pressedCardServiceName == serviceName
                ? Color(0xFFF0630B)
                : isDarkMode
                ? Colors.grey[200]
                : Color(0xFF303030),
            child: Column(
              children: [
                IconButton(
                  icon: Image(
                    image: NetworkImage(imageUrl),
                    width: 50,
                    height: 50,
                    color: pressedCardServiceName == serviceName
                        ? Colors.white
                        : Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      pressedCardServiceName = serviceName;
                    });
                    print('Service ID: $serviceId');
                    navigateTo(context, OrdServices( serviceId: serviceId,userToken:widget.userToken,));
                  },
                ),
                Text(
                  serviceName.tr(),
                  style: TextStyle(
                    fontSize: 12,
                    color: pressedCardServiceName == serviceName
                        ? Colors.white
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
