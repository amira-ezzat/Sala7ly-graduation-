import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/screens/home/home_screen.dart';
import '../modules/screens/offer.dart';
import '../modules/screens/order/order.dart';
import '../modules/screens/order_parts/parts.dart';
import '../modules/screens/serviceasfire/services.dart';
import '../shared/cubit/cubit.dart';
import '../modules/screens/order_parts/modelParts.dart'; // تأكد من استيراد النموذج Parts
import '../shared/componants/constant.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Layout extends StatefulWidget {
  final String userToken;

  Layout({required this.userToken});
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final PageController _myPage = PageController(initialPage: 0);
  late int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize state or fetch data using the userToken
    _fetchUserData();
  }

  void _fetchUserData() async {
    try {
      // Example: Fetch user data using the userToken
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final savedToken = prefs.getString('userToken');
      // Use the token to fetch user data or initialize the state
      print('User token: $savedToken');
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<sla7lyCubit, sal7lyState>(
        builder: (context, state) {
          var cubit = sla7lyCubit.get(context);
          return PageView(
            controller: _myPage,
            onPageChanged: (int) {
              print('Page Changes to index $int');
              updateSelectedIndex(int);
            },
            children: <Widget>[
              HomeScreen(),
              Services(),
              Orders(ordersList: cubit.ordersList),
              Offers(),
              PartsScreen(ordersList: cubit.ordersList),
            ],
            physics: NeverScrollableScrollPhysics(),
          );
        },
      ),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  Widget buildFloatingActionButton() {
    return CircleAvatar(
      radius: 35,
      backgroundColor: AppCubit.get(context).isDark ? Colors.white : Color(0xFF303030),
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Color(0xFFF0630B),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: IconButton(
            iconSize: 30.0,
            icon: Image.asset(
              'assets/images/h.png',
              width: 25,
              height: 25,
              color: selectedIndex == 0 ? Color(0xFFF0630B) : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _myPage.jumpToPage(0);
                updateSelectedIndex(0);
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      elevation: 0.3,
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildTabIconButton(1, 'assets/images/s.png', 38),
          SizedBox(width: 11),
          buildTabIconButton(2, 'assets/images/or.png', 43),
          SizedBox(width: 33),
          buildTabIconButton(3, 'assets/images/o.png', 27),
          SizedBox(width: 11),
          buildTabIconButton(4, 'assets/images/t.png', 30),
        ],
      ),
    );
  }

  Widget buildTabIconButton(int index, String imagePath, double iconSize) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _myPage.jumpToPage(index);
            updateSelectedIndex(index);
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  width: iconSize,
                  height: iconSize,
                  color: selectedIndex == index ? Color(0xFFF0630B) : Colors.grey,
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 2,
                width: 44,
                color: selectedIndex == index ? Color(0xFFF0630B) : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
