import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala7ly/layout/layout_screen.dart';
import 'package:sala7ly/modules/screens/confirm.dart';
import 'package:sala7ly/modules/screens/order_services/model.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/styles/icon.dart';
import 'package:http/http.dart' as http;
class OrdServices extends StatefulWidget {
  final String serviceId;
  final String userToken;


  OrdServices({required this.serviceId,required this.userToken});
  @override
  State<OrdServices> createState() => _OrdServicesState();
}

class _OrdServicesState extends State<OrdServices> {
  var nomberController = TextEditingController();
  var problemController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var addressController = TextEditingController();
  bool isArabiclPressed = false;
  bool isEnglishPressed = false;
  bool isCashSelected = true;
  bool isTypeSelected = true;


  Order createOrder() {
    return Order(
      serviceId: widget.serviceId,
      shippingAddress: addressController.text,
      problemDesc: problemController.text,
      orderDate: dateController.text,
      orderTime: timeController.text,
      orderType: isTypeSelected ? 'Normal' : 'Emergency',
      phoneNumber: nomberController.text,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request Order'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Phone Number'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: nomberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number'.tr(),
                  hintStyle: TextStyle(
// fontFamily: 'font4'
                      fontSize: 15,
                      color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Address'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: addressController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter your address'.tr(),
                  hintStyle: TextStyle(
// fontFamily: 'font4'
                      fontSize: 15,
                      color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Date'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    hintText: 'Specify date of order..'.tr(),
                    hintStyle: TextStyle(
// fontFamily: 'font4'
                        fontSize: 15,
                        color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    prefixIcon: Icon(
                      IconBroken.Calendar,
                      color: Colors.grey,
                    )),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    dateController.text = DateFormat.yMMMd().format(pickedDate);
                  }
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Time'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.datetime,
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    timeController.text = value!.format(context).toString();
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Specify time of order..'.tr(),
                    hintStyle: TextStyle(
// fontFamily: 'font4'
                        fontSize: 15,
                        color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    prefixIcon: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Problem'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: problemController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Write your problem or.....'.tr(),
                  hintStyle: TextStyle(
// fontFamily: 'font4'
                      fontSize: 15,
                      color: Colors.grey),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.Voice,
                        color: Colors.grey.shade400,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Type Request'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Align(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTypeSelected = !isTypeSelected;
                    });
                  },
                  child: Container(
                    width: 370,
                    height: 66,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isTypeSelected = true;
                            });
                          },
                          icon: Icon(
                            isTypeSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: isTypeSelected
                                ? Color(0xFFF0630B)
                                : Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Normal'.tr(),
                          style: TextStyle(
                            fontFamily: 'font2',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 55),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isTypeSelected = false;
                            });
                          },
                          icon: Icon(
                            isTypeSelected
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: isTypeSelected
                                ? Colors.grey[600]
                                : Color(0xFFF0630B),
                          ),
                        ),
                        Text(
                          'Emergency'.tr(),
                          style: TextStyle(
                            fontFamily: 'font2',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Paying Off'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Align(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCashSelected = !isCashSelected;
                    });
                  },
                  child: Container(
                    width: 370,
                    height: 66,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isCashSelected = true;
                            });
                          },
                          icon: Icon(
                            isCashSelected
                                ? Icons.circle_rounded
                                : Icons.circle_outlined,
                            color: isCashSelected
                                ? Color(0xFFF0630B)
                                : Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Cash'.tr(),
                          style: TextStyle(
                            fontFamily: 'font2',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 66),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isCashSelected = false;
                            });
                          },
                          icon: Icon(
                            isCashSelected
                                ? Icons.circle_outlined
                                : Icons.circle_rounded,
                            color: isCashSelected
                                ? Colors.grey[600]
                                : Color(0xFFF0630B),
                          ),
                        ),
                        Text(
                          'Wallet'.tr(),
                          style: TextStyle(
                            fontFamily: 'font2',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
// Your existing form fields go here...
              SizedBox(
                height: 55,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppCubit.get(context).isDark
                      ? HexColor('#F0630B')
                      : HexColor('#D8590A'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Confirm(
                        order: createOrder(),
                        userToken: widget.userToken,
                      ),
                    );
                  },
                  child: Text(
                    'Send'.tr(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
