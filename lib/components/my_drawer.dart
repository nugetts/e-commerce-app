import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerence_app/components/my_list_tile.dart';
import 'package:ecommerence_app/models/user_provider.dart';
import 'package:ecommerence_app/models/theme_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header с логотипом
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    'lib/design/logo_new.png',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Ссылка на магазин
              MyListTile(
                text: "Наш магазин",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // Ссылка на корзину
              MyListTile(
                text: "Корзина",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              // Ссылка на страницу "О нас"
              MyListTile(
                text: "О нас",
                icon: Icons.info,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/about_page');
                },
              ),
            ],
          ),

          // Нижний блок: смена темы + выход
          Column(
            children: [
              // Кнопка смены темы
              MyListTile(
                text: "Сменить тему",
                icon: Icons.brightness_6,
                onTap: () {
                  context.read<ThemeProvider>().toggleTheme();
                  
                },
              ),

              // Кнопка выхода
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: MyListTile(
                  text: "Выйти",
                  icon: Icons.logout,
                  onTap: () {
                    context.read<UserProvider>().logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login_page', (route) => false);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
