import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerence_app/components/my_button.dart';
import 'package:ecommerence_app/models/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Заголовок
              Text(
                "Вход",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 30),

              // Поле Email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Поле Пароль
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Пароль",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Кнопка Войти
              MyButton(
                onTap: () {
                  // Устанавливаем статус логина
                  context.read<UserProvider>().login();

                  // Переходим на IntroPage
                  Navigator.pushReplacementNamed(context, '/intro_page');
                },
                child: const Text("Войти"),
              ),
              const SizedBox(height: 16),

              // Ссылка на регистрацию (контрастный цвет)
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_page');
                },
                child: Text(
                  "Нет аккаунта? Зарегистрироваться",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue, // теперь всегда видно
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}