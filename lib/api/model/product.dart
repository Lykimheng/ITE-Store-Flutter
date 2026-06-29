class Product {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}