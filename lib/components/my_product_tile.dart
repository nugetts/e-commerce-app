import 'package:ecommerence_app/models/product.dart';
import 'package:ecommerence_app/models/shop.dart';
import 'package:ecommerence_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  void _addToCart(BuildContext context) {
    // Определяем, нужен ли выбор размера
    List<String> sizes = [];
    if (product.category == "clothes") {
      sizes = ["XS", "S", "M", "L", "XL"];
    } else if (product.category == "shoes") {
      sizes = ["36", "37", "38", "39", "40", "41", "42", "43"];
    }

    final inStock = product.stock > 0;
    if (!inStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Товара нет в наличии")),
      );
      return;
    }

    // Если размеры есть — показываем диалог
    if (sizes.isNotEmpty) {
      String? selectedSize;
      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text("Выберите размер"),
            content: DropdownButton<String>(
              value: selectedSize,
              hint: const Text("Размер"),
              isExpanded: true,
              items: sizes.map((s) => DropdownMenuItem(
                value: s,
                child: Text(s),
              )).toList(),
              onChanged: (value) {
                setState(() => selectedSize = value);
              },
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Отмена"),
              ),
              MaterialButton(
                onPressed: () {
                  if (selectedSize != null) {
                    final productWithSize = product.copyWith(size: selectedSize);
                    context.read<Shop>().AddToCart(productWithSize);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${product.name} (размер $selectedSize) добавлен в корзину",
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Выберите размер")),
                    );
                  }
                },
                child: const Text("Добавить"),
              ),
            ],
          ),
        ),
      );
    } else {
      // Для товаров без размеров добавляем сразу
      context.read<Shop>().AddToCart(product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${product.name} добавлен в корзину")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inStock = product.stock > 0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(product.imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(product.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  const SizedBox(height: 8),
                  Text('₼${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    inStock ? 'В наличии: ${product.stock}' : 'Нет в наличии',
                    style: TextStyle(
                        color: inStock ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: inStock ? Colors.blue : Colors.grey,
              onPressed: () => _addToCart(context),
            ),
          ],
        ),
      ),
    );
  }
}
