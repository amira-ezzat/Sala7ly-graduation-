import 'dart:convert';

class getOrder {
  final String id; // Add this line
  final String problemDesc;
  final String orderDate;
  final String orderTime;
  final String orderType;

  getOrder({
    required this.id, // Add this line
    required this.problemDesc,
    required this.orderDate,
    required this.orderTime,
    required this.orderType,
  });

  // تحويل JSON إلى Order
  factory getOrder.fromJson(Map<String, dynamic> json) {
    return getOrder(
      id: json['_id'] ?? 'N/A', // Ensure that 'id' is mapped correctly
      problemDesc: json['problemDesc'] ?? 'N/A',
      orderDate: json['orderDate'] ?? 'N/A',
      orderTime: json['orderTime'] ?? 'N/A',
      orderType: json['orderType'] ?? 'N/A',
    );
  }

  // تحويل Order إلى JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id, // Add this line
      'problemDesc': problemDesc,
      'orderDate': orderDate,
      'orderTime': orderTime,
      'orderType': orderType,
    };
  }
}
