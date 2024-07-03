// class Order {
//   final String id;
//   final String name;
//   final String type;
//   final DateTime date;
//   final String time;
//
//   Order({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.date,
//     required this.time,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'type': type,
//       'date': date.toIso8601String(),
//       'time': time,
//     };
//   }
//
//   static Order fromMap(Map<String, dynamic> map) {
//     return Order(
//       id: map['id'] ?? '',
//       name: map['name'] ?? '',
//       type: map['type'] ?? '',
//       date: DateTime.parse(map['date'] ?? DateTime.now().toIso8601String()),
//       time: map['time'] ?? '',
//     );
//   }
// }
