import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/modules/screens/order_parts/succesful.dart';
import 'package:sala7ly/shared/componants/navegate.dart';

import '../../../shared/cubit/cubit.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            'https://img.freepik.com/premium-photo/glass-jar-with-golden-coin-mobile-phones-online-payment-banking-online-shopping_9083-21485.jpg?w=740',
            width: double.infinity,
            height: 244,
            fit: BoxFit.cover, // تعيين خاصية BoxFit لتحقيق تعبئة العرض
          ),
          //SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Details Order  '.tr()
                      ,style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22
                      ),),

                  ],
                ),
                SizedBox(height: 22,),
                Row(
                  children: [
                    Text('Pair Parts : '.tr()
                    ,style:TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF0630B),
                        fontSize: 22
                      ),),
                    SizedBox(width: 11),
                    Text('Drill'.tr()
                      ,style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18
                      ),),
                  ],
                ),
                SizedBox(height: 11,),
                Row(
                  children: [
                    Text('Total: '.tr()
                      ,style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF0630B),
                          fontSize: 22
                      ),),
                    SizedBox(width: 11),
                    Text('60 '
                        'EG'.tr()
                      ,style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18
                      ),),
                  ],
                ),
                SizedBox(height: 11,),
                Row(
                  children: [
                    Text('Quantity : '.tr()
                      ,style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF0630B),
                          fontSize: 22
                      ),),
                    SizedBox(width: 11),
                    Text('3'.tr()
                      ,style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18
                      ),),
                  ],
                ),
                SizedBox(height: 155,),
                Container(
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).isDark
                        ? HexColor('#F0630B')
                        : HexColor('#D8590A'),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      navigateTo(context, PaySuccess());
                    },
                    child: Text(
                      'Check out'.tr(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
