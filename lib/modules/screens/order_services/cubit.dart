// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:sala7ly/modules/screens/order_services/states.dart';
//
// import 'model.dart';
//
// class OrderCubit extends Cubit<OrderState> {
//   final Dio _dio = Dio();
//   OrderCubit() : super(OrderInitial());
//
//   Future<void> createOrder(Order order) async {
//     try {
//       print('Order data: ${order.toJson()}');
//
//       var response = await Dio().post(
//         'https://sala7ly.vercel.app/service-order',
//         data: order.toJson(),
//       );
//
//       if (response.statusCode == 201) {
//         print(response.data['msg']);
//       } else {
//         print(
//             'Failed to create order with status code: ${response.statusCode}');
//         print('Response data: ${response.data}');
//       }
//     } catch (e) {
//       if (e is DioError) {
//         print('DioError: ${e.message}');
//         if (e.response != null) {
//           print('Response data: ${e.response?.data}');
//         }
//       } else {
//         print('Unexpected error: $e');
//       }
//     }
//   }
//   }
