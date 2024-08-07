class SparePart {
  final String id;
  final String title;
  final String imageUrl;
  final double basePrice;
  final double appliedPrice;

  SparePart({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.basePrice,
    required this.appliedPrice,
  });

  factory SparePart.fromJson(Map<String, dynamic> json) {
    return SparePart(
      id: json['_id'] as String,
      title: json['title'] as String,
      imageUrl: json['coverImage']['secure_url'] as String,
      basePrice: json['basePrice'].toDouble(),
      appliedPrice: json['appliedPrice'].toDouble(),
    );
  }
}