class MyOrder {
  final String phoneNumber;
  final String date;
  final String time;
  final String problem;

  MyOrder({
    required this.phoneNumber,
    required this.date,
    required this.time,
    required this.problem,
  });

  factory MyOrder.fromMap(Map<String, dynamic> map) {
    return MyOrder(
      phoneNumber: map['phoneNumber'],
      date: map['date'],
      time: map['time'],
      problem: map['problem'],
    );
  }
}
