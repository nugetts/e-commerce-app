import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/shop.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedSize;

  void addToCart() {
    if (widget.product.stock == 0) return;

    final shop = context.read<Shop>();

    if (widget.product.category == "clothes" || widget.product.category == "shoes") {
      if (selectedSize != null) {
        shop.AddToCart(widget.product.copyWith(size: selectedSize));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.product.name} (размер $selectedSize) добавлен в корзину"))
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Выберите размер"))
        );
      }
    } else {
      shop.AddToCart(widget.product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${widget.product.name} добавлен в корзину"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> sizeOptions = [];
    if (widget.product.category == "clothes") sizeOptions = ["XS", "S", "M", "L", "XL"];
    if (widget.product.category == "shoes") sizeOptions = ["38", "39", "40", "41", "42", "43"];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AspectRatio(aspectRatio: 1, child: Image.asset(widget.product.imagePath)),
            const SizedBox(height: 20),
            Text(widget.product.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text('₼${widget.product.price.toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 20)),
            const SizedBox(height: 10),
            Text(widget.product.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(height: 10),
            Text('Осталось: ${widget.product.stock}', style: const TextStyle(fontWeight: FontWeight.bold)),
            if (sizeOptions.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text("Выберите размер:", style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    value: selectedSize,
                    hint: const Text("Размер"),
                    isExpanded: true,
                    items: sizeOptions.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (v) => setState(() => selectedSize = v),
                  ),
                ],
              ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: widget.product.stock > 0
        ? FloatingActionButton.extended(
            onPressed: addToCart,
            label: Text("В корзину", style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)),
          )
        : FloatingActionButton.extended(
            onPressed: null,
            backgroundColor: Colors.grey,
            label: const Text("Нет в наличии"),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
