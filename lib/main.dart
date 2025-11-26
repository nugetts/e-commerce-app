import 'package:ecommerence_app/pages/about_page.dart';
import 'package:ecommerence_app/pages/Loginpage.dart';
import 'package:ecommerence_app/pages/register_page.dart';
import 'package:ecommerence_app/pages/intro_page.dart';
import 'package:ecommerence_app/pages/shop_page.dart';
import 'package:ecommerence_app/pages/cart_page.dart';
import 'package:ecommerence_app/themes/dark_mode.dart';
import 'package:ecommerence_app/themes/light_mode.dart';
import 'package:ecommerence_app/models/shop.dart';
import 'package:ecommerence_app/models/user_provider.dart';
import 'package:ecommerence_app/models/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, ThemeProvider>(
      builder: (context, user, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.isDarkMode ? darkMode : lightMode,
          home: user.isLoggedIn ? const Intropage() : const LoginPage(),
          routes: {
            '/login_page': (context) => const LoginPage(),
            '/register_page': (context) => const RegisterPage(),
            '/intro_page': (context) => const Intropage(),
            '/shop_page': (context) => const ShopPage(),
            '/cart_page': (context) => const CartPage(),
            '/about_page': (context) => const AboutPage(),
          },
        );
      },
    );
  }
}
