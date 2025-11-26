class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String category; // "clothes", "perfume", "jewelry"
  final String? size; // выбранный размер (только для одежды)
  final int stock; // количество товара

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    this.size,
    required this.stock,
  });

  // метод для копирования с возможностью изменения размера и stock
  Product copyWith({String? size, int? stock}) {
    return Product(
      name: name,
      price: price,
      description: description,
      imagePath: imagePath,
      category: category,
      size: size ?? this.size,
      stock: stock ?? this.stock,
    );
  }
}
