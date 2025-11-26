import 'package:flutter/material.dart';
import 'product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Lizarde Elegante.",
      description: "Глубокий древесный аромат, 100 мл.",
      imagePath: 'lib/design/duhi.jpeg',
      price: 270,
      category: "perfume",
      stock: 5,
    ),
    Product(
      name: "Lizard Pijama",
      description: "92% хлопка и 10% модала.",
      imagePath: 'lib/design/pijama.jpeg',
      price: 119.99,
      category: "clothes",
      stock: 3,
    ),
    Product(
      name: "Lizard female sweetshort",
      description: "90% хлопка и 10% полиэстера.",
      imagePath: 'lib/design/xalat.jpeg',
      price: 109.99,
      category: "clothes",
      stock: 2,
    ),
    Product(
      name: "Lizard male zipper",
      description: "80% хлопка, 15% полиэстера, 5% эластана.",
      imagePath: 'lib/design/zipper.jpeg',
      price: 99.99,
      category: "clothes",
      stock: 4,
    ),
    Product(
      name: "Lizard t-shirt",
      description: "80% органического хлопка, 15% вискозы, 5% эластана.",
      imagePath: 'lib/design/mayka.jpeg',
      price: 69.99,
      category: "clothes",
      stock: 6,
    ),
    Product(
      name: "Lizard shoes",
      description: "Верх: натуральная кожа, Подкладка: натуральная кожа, Стелька: натуральная кожа, Подошва: ТЭП.",
      imagePath: 'lib/design/obuv.jpeg',
      price: 199.99,
      category: "shoes",
      stock: 0, // один из товаров нет в наличии
    ),
    Product(
      name: "Lizard bracelet",
      description: "Браслет, в котором стиль встречается с простотой.",
      imagePath: 'lib/design/braclet.jpeg',
      price: 139,
      category: "bracelet",
      stock: 5,
    ),
    Product(
      name: "Lizard glasses",
      description: "Эти очки созданы для тех, кто ценит стиль, комфорт и уверенность.",
      imagePath: 'lib/design/ochki.jpeg',
      price: 200,
      category: "glasses",
      stock: 3,
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void AddToCart(Product item) {
    if (item.stock > 0) {
      final index = _shop.indexWhere(
          (p) => p.name == item.name && (p.size ?? "") == (item.size ?? ""));
      if (index != -1) {
        _shop[index] = _shop[index].copyWith(stock: _shop[index].stock - 1);
      }
      _cart.add(item);
      notifyListeners();
    }
  }

  void RemoveFromCart(Product item) {
    _cart.remove(item);
    final index = _shop.indexWhere(
        (p) => p.name == item.name && (p.size ?? "") == (item.size ?? ""));
    if (index != -1) {
      _shop[index] = _shop[index].copyWith(stock: _shop[index].stock + 1);
    }
    notifyListeners();
  }
}
