import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/componants/navegate.dart';
import '../../shared/cubit/cubit.dart';
import 'ssettingss.dart';
class Contact extends StatelessWidget {
  var emailcontainer=TextEditingController();
  var namecontainer=TextEditingController();
  var messagecontainer=TextEditingController();


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
          'Contact Us'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                SizedBox(height: 22.0),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '  Name'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: namecontainer,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey.shade400,
                    decoration: InputDecoration(
        
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
        
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '  Email Or Phone number'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: emailcontainer,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.grey.shade400,
                    decoration: InputDecoration(
                      //hintText: 'Enter Your Name'.tr(),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
        
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '  Message'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: namecontainer,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey.shade400,
                    decoration: InputDecoration(
                      //prefixIcon: Icon(Icons.message_sharp),
                      //hintText: 'Enter Your Name'.tr(),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
        
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.0),
                Container(
                  decoration: BoxDecoration(
                    color:AppCubit.get(context).isDark?  HexColor('#F0630B'):HexColor('#D8590A') ,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
        
                    },
                    child: Text(
                      'Submit'.tr(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                    Column(
                      children: [
                        Text('Follow us on'.tr(),
                            style:TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/images/g.png',
                                height: 20.0,width: 20.0,),

                            ),
                            SizedBox(
                              height: 20,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon:Icon(Icons.facebook,
                                size: 25.0,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/images/inst.jpeg',
                                height: 20.0,width: 20.0,),

                            ),
                            SizedBox(
                              height: 20,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/images/what.jpg',
                                height: 33.0,width: 33.0,),

                            ),
                          ],
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
}
