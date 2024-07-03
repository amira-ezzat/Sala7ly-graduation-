import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/login/first_login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../shared/componants/navegate.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/login.dart';

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class BoardingScreen extends StatefulWidget {
  @override
  State<BoardingScreen> createState() => _BoardingScreen();
}

class _BoardingScreen extends State<BoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/4.png',
        title: '  WE PROVIDE\n   QUALITY SERVICE'.tr(),
        body:  'Experts in various services like: Plumbing, electricity, carpentry,\ncleaning,painting, computer equipment, etc.'.tr()
    ),
    BoardingModel(
        image: 'assets/images/6.png',
        title: 'YOUR COMFORTABLE \n IS IMPORTANT US'.tr(),
        body: 'The best way to serve\n you while you are at your place.'.tr()
    ),
    BoardingModel(
        image: 'assets/images/7.png',
        title: 'WE PREPARED FOR \n ANY EMERGENCY'.tr(),
        body: '   Call us and we will \n   reach you as soon as \n   possible.'.tr()
    ),
  ];
  bool isLast=false;
  void submit()
  {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if(value)
      {
        navigateAndFinish(
            context,
            LoginScreen()
        );
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#FEEFE7'),
        actions: [
          TextButton(
            onPressed: (){
              submit();
            },
            child: Text(
              'SKIP'.tr(),
              style: TextStyle(
                fontFamily: 'font1',
                color: HexColor('#F0630B'),

              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: HexColor('#FEEFE7'),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    controller: boardController,
                    onPageChanged: (int index){
                      if(index==boarding.length-1)
                      {
                        setState(() {
                          isLast=true;
                        });
                      }
                      else
                      {
                        setState(() {
                          isLast=false;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,

                      effect: ExpandingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: HexColor('#F0630B'),
                        dotHeight: 10,
                        dotWidth: 15,
                        expansionFactor: 2,
                        spacing: 6.0,
                      ),
                      count: boarding.length,
                    ),
                    Spacer(),
                    FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor:HexColor('#F0630B') ,
                      onPressed: () {

                        if(isLast)
                        {
                          submit();
                        }
                        else
                        {
                          boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }

                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(
            model.image,
          ),
        ),
      ),
      Text(
        ' ${model.title}',
        style: TextStyle(
          fontSize: 24.0,
         fontFamily:'font1',
         //  fontWeight: FontWeight.bold,
          color: HexColor('#F0630B'),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          // height: 3.0,
          // wordSpacing:9.0,
          fontSize: 19.0,
          fontFamily:'font3',
         color: Colors.black54
        ),
      ),
    ],
  );
}
