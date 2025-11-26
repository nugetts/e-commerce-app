import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerence_app/components/my_button.dart';
import 'package:ecommerence_app/models/user_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
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
                "Регистрация",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 30),

              // Поле Имя
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Имя",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

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

              // Кнопка Зарегистрироваться
              MyButton(
                onTap: () {
                  // После регистрации автоматически логиним
                  context.read<UserProvider>().login();

                  // Переходим на IntroPage
                  Navigator.pushReplacementNamed(context, '/intro_page');
                },
                child: const Text("Зарегистрироваться"),
              ),
              const SizedBox(height: 12),

              // Ссылка на вход
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_page');
                },
                child: const Text(
                  "Уже есть аккаунт? Войти",
                  style: TextStyle(
                    color: Colors.blue, // фиксированный синий
                    fontWeight: FontWeight.bold,
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

