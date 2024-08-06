import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala7ly/layout/cubit/state.dart';

import '../../model/userModel.dart';
import '../../modules/screens/home/home_screen.dart';
import '../../modules/screens/offer.dart';
import '../../modules/screens/order/order.dart';
import '../../modules/screens/order_parts/modelParts.dart';
import '../../modules/screens/order_parts/parts.dart';
import '../../modules/screens/serviceasfire/services.dart';
import '../../shared/componants/constant.dart';

class sla7lyCubit extends Cubit<sal7lyState> {
  final String userToken;
  sla7lyCubit({required this.userToken,}) : super(InitialState()) {
    // إعداد الشاشات في دالة البناء
    screens = [
      HomeScreen(userToken: userToken,),
      Services(userToken:userToken,),
      Orders(),
      Offers(),
      OrderParts(),
    ];
  }

 // List<Parts> ordersList = [];

  static sla7lyCubit get(context) => BlocProvider.of(context);
  Sala7lyUserModel? userModel;

  void getUserData() {
    emit(GetUserLoadingStates());
    final url = Uri.parse('http://sala7lyapi.runasp.net/api/Client/Register');

    http.get(url).then((response) {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        userModel = Sala7lyUserModel.fromJson(jsonData);
        emit(GetUserSuccessStates());
      } else {
        emit(GetUserErrorStates('Failed to load user data'));
      }
    }).catchError((error) {
      emit(GetUserErrorStates(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}
