import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sala7ly/modules/screens/notification.dart';

import '../../../shared/componants/navegate.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/styles/icon.dart';
import '../../Drawer/Drawing.dart';
import '../create_order/order_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  bool isNoSelected = false;
  String pressedCardServiceName = ''; // New variable to track pressed card

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  isNoSelected = !isNoSelected;
                });
                navigateTo(context, Notificat());
              },
              child: Container(
                width: 24,
                height: 24,
                child: isNoSelected
                    ? SvgPicture.asset(
                  'assets/image/bell-fill-24.svg',
                  width: 24,
                  height: 24,
                  color: Colors.black,
                )
                    : SvgPicture.asset(
                  'assets/image/bell-24.svg',
                  width: 24,
                  height: 24,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
          title: Container(
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
        ),
        drawer: Draw(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Image(image: AssetImage('assets/images/hh.jpg'),
                    fit: BoxFit.cover,),

                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '    Most requested services'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCard('Carpenter', 'assets/images/c.png'),
                      buildCard('Mechanical', 'assets/images/m.png'),
                      buildCard('Electrical', 'assets/images/ee.png'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCard('Plumber', 'assets/images/pp.png'),
                      buildCard('Building', 'assets/images/b.png'),
                      buildCard('Painting', 'assets/images/pa.png'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCard('Appliances', 'assets/images/appliances.png'),
                      buildCard('Photography', 'assets/images/photo.png'),
                      buildCard('Ground\nInstallation', 'assets/images/see.png'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 66,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(String serviceName, String imagePath) {
    return Container(
      height: 120,
      width: 120,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: pressedCardServiceName == serviceName ? 0.0 : 2.0,
        margin: EdgeInsets.all(10.0),
        color: pressedCardServiceName == serviceName
            ? Color(0xFFF0630B)
            :AppCubit.get(context).isDark
            ?Colors.grey[200]
            :  Color(0xFF303030),
        child: Column(
          children: [
            IconButton(
              icon: ImageIcon(
                AssetImage(imagePath),
                size: 50,
                color: pressedCardServiceName == serviceName
                    ? Colors.white
                    // : AppCubit.get(context).isDark
                    // ? Colors.white
                    : Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  pressedCardServiceName = serviceName;
                });
                navigateTo(context, OrdServicess());
              },
            ),
            Text(
              serviceName.tr(),
              style: TextStyle(
                fontSize: 12,
                color: pressedCardServiceName == serviceName
                    ? Colors.white
                    // : AppCubit.get(context).isDark
                    // ? Colors.white
                    : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
