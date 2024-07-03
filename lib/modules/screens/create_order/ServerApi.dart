// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:sala7ly/modules/screens/create_order/model.dart';
//
//
// class OrderService {
//   static const String apiUrl = 'http://sala7lyapi.runasp.net/api/Order/MakeOrder';
//
//   static Future<bool> makeOrder(Order order) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(order.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         // Successful request
//         return true;
//       } else {
//         // Handle other status codes (e.g., show error message)
//         print('Failed to make order: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       // Handle network errors
//       print('Exception during order creation: $e');
//       return false;
//     }
//   }
// }
