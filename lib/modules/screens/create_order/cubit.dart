// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:sala7ly/modules/screens/create_order/model.dart';
//
// class OrderService {
//   static Future<void> createOrder(Order order) async {
//     final url = Uri.parse('http://sala7lyapi.runasp.net/api/Order/MakeOrder');
//     final accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhbWlyYWV6emFyQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiYWJiNzg0NWQtZmMzYy00MGEzLTkyMWUtYzJlNDI1NWNjMTdhIiwianRpIjoiMzQwNjRiNmYtODZjNy00ODdmLThkYzctMzc2NjA0Mzc4YTUwIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQ2xpZW50IiwiZXhwIjoxNzE5ODQxMzExLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjU5NTU5LyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.bGruHnb6l5ImU6h3sw8oZ6YDUky_VXB6WYL16NrYfmo';
//
//     final orderJson = jsonEncode(order.toJson());
//     print('Order JSON: $orderJson'); // Log the JSON being sent
//
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $accessToken',
//       },
//       body: orderJson,
//     );
//
//     print('Status Code: ${response.statusCode}');
//     print('Response Body: ${response.body}');
//
//     if (response.statusCode != 201) {
//       throw Exception('Failed to create order');
//     }
//   }
// }
