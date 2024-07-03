import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/componants/navegate.dart';
import '../Drawer/profil/profile.dart';
import 'ssettingss.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            navigateTo(context, Settings());
          },
        ),
        title: Text(
          'About Us'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 44,),
              Text(
                'Sala7ly offers the best services provided\nby specialized craftsmen.'.tr(),
                style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade400
                ),
              ),
              SizedBox(height: 22,),
              Center(
                child: Text(
                  'Our services'.tr(),
                  style: TextStyle(
                     // color:  Color(0xFFF0630B) ,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Electrical appliance repair:'.tr(),
                  style: TextStyle(
                      color:  Color(0xFFF0630B) ,
                      fontSize: 19
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'We provide electrical appliance repair services with'
                    'the highest levels of quality and efficiency.'.tr(),
                style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade400
                ),
              ),
              SizedBox(height: 22,),
              Container(
                height: 1,
                width:double.infinity,
                color: Colors.grey.shade500,
        
              ),
              SizedBox(height: 22,),
              Text(
                'Design and implementation of wooden furniture:'.tr(),
                style: TextStyle(
                    color:  Color(0xFFF0630B) ,
                    fontSize: 19
                ),
              ),
              SizedBox(height: 5,),
              Text(
                  'We specialize in designing and implementing wooden furniture according to your needs and requirement'.tr(),
                style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade400
                ),
              ),
              SizedBox(height: 22,),
              Container(
                height: 1,
                width:double.infinity,
                color: Colors.grey.shade500,
        
              ),
              SizedBox(height: 22,),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Plumbing services:'.tr(),
                  style: TextStyle(
                      color:  Color(0xFFF0630B) ,
                      fontSize: 19
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'We provide highly skilled plumbing services at competitive prices'.tr(),
                style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade400
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
