import 'package:ecommerence_app/components/my_button.dart';
import 'package:ecommerence_app/models/product.dart';
import 'package:ecommerence_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: const Text("Удалить этот товар с корзины?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Нет"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().RemoveFromCart(product);
            },
            child: const Text("Да"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context){
    showDialog(
      context: context, 
      builder:(context) => const AlertDialog(
        content: Text("Пользователь хочет оплатить! но у нас нет бэкэнда хыхы"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ваша корзина"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty 
            ? const Center(child: Text("Ваша корзина пустая...")) 
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  leading: Image.asset(
                    item.imagePath,
                    height: 100,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.size != null
                      ? "${item.size} • ₼${item.price.toStringAsFixed(2)}"
                      : "₼${item.price.toStringAsFixed(2)}"
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove), 
                    onPressed:() => removeItemFromCart(context, item),
                  ),
                );
              } 
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: MyButton(onTap:() => payButtonPressed(context), child: const Text("ОПЛАТИТЬ СЕЙЧАС")),
          ),
        ],
      ),
    );
  }
}
