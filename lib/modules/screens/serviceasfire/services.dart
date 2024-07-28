import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sala7ly/modules/screens/create_order/order_services.dart';
import 'package:sala7ly/shared/componants/navegate.dart';
import 'package:sala7ly/shared/cubit/cubit.dart';

import '../../../layout/layout_screen.dart';
import '../../../shared/cubit/state.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  String pressedCardServiceName = '';
  var searchController = TextEditingController();
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
           // navigateTo(context, Layout());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppCubit.get(context).isDark
                    ? Colors.grey[200]
                    : Colors.grey[700],
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: '  Search'.tr(),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:  EdgeInsets.symmetric(vertical: 3.0,horizontal: 15),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      'assets/image/search-24.svg',
                      width: 30,
                      height: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Carpenter', 'assets/images/c.png'),
                  buildCard('Mechanical', 'assets/images/m.png'),
                  buildCard('Conch', 'assets/images/co.png'),
                ],
              ),

            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Electrical', 'assets/images/ee.png'),
                  buildCard('Building', 'assets/images/b.png'),
                  buildCard('Painting', 'assets/images/pa.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Smith', 'assets/images/s7.png'),
                  buildCard('Plumber', 'assets/images/pp.png'),
                  buildCard('Digging', 'assets/images/df.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Computer\nEquipment', 'assets/images/eq.png'),
                  buildCard('Conditioning', 'assets/images/ac.png'),
                  buildCard('Gybsum Board', 'assets/images/ce.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Glass\nInstallation', 'assets/images/w.png'),
                  buildCard('Cracking', 'assets/images/cr.png'),
                  buildCard('Ground\nInstallation', 'assets/images/see.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Women’s salon', 'assets/images/girl.png'),
                  buildCard('Men’s Salon', 'assets/images/man.png'),
                  buildCard('Chef', 'assets/images/ch.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Farmer', 'assets/images/farm.png'),
                  buildCard('Photography', 'assets/images/photo.png'),
                  buildCard('Party Organizer', 'assets/images/party.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard('Appliances', 'assets/images/appliances.png'),
                  buildCard('Upholstered', 'assets/images/sl.png'),
                  buildCard('Sweets', 'assets/images/dess.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  buildCard('Alumetal'.tr(), 'assets/images/k.png'),
                  buildCard('Cleaning', 'assets/images/clean.png'),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String serviceName, String imagePath) {
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
                ?  Colors.grey[200]
                : Color(0xFF303030),
            child: Column(
              children: [
                IconButton(
                  icon: ImageIcon(
                    AssetImage(imagePath),
                    size: 50,
                    color: pressedCardServiceName == serviceName
                        ? Colors.white
                    // : isDarkMode
                    // ? Colors.white
                        : Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      pressedCardServiceName = serviceName;
                    });
                    navigateTo(context, OrdServices());
                  },
                ),
                Text(
                  serviceName.tr(),
                  style: TextStyle(
                    fontSize: 12,
                    color: pressedCardServiceName == serviceName
                        ? Colors.white
                    // : isDarkMode
                    // ? Colors.white
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