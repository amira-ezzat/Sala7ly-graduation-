class Order {
  final String serviceId;
  final String shippingAddress;
  final String problemDesc;
  final String orderDate;
  final String orderTime;
  final String orderType;
  final String phoneNumber;

  Order({
    required this.serviceId,
    required this.shippingAddress,
    required this.problemDesc,
    required this.orderDate,
    required this.orderTime,
    required this.orderType,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'shippingAddress': shippingAddress,
      'problemDesc': problemDesc,
      'orderDate': orderDate,
      'orderTime': orderTime,
      'orderType': orderType,
      'phoneNumber': phoneNumber,
    };
  }
}