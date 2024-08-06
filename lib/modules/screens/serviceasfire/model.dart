class Service {
  final String id;
  final String title;
  final String imageUrl;

  Service({required this.id, required this.title, required this.imageUrl});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['serviceImg']['secure_url'] ?? '',
    );
  }
}
  List<Service> services = [];

