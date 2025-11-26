import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart'; 

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("О нас"),
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок + иконка
            Center(
              child: Column(
                children: [
                  const Icon(
                    LucideIcons.store,
                    size: 80,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "The Lizards",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Магазин уникального мерча и аксессуаров",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Блок "О нас"
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Добро пожаловать в наш магазин! Здесь вы найдете лучшие товары мира мерча — "
                  "от стильных футболок до аксессуаров, созданных с любовью. "
                  "Мы верим, что каждая деталь может подчеркнуть индивидуальность и настроение.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Контакты
            Text(
              "Контакты",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 12),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _ContactRow(
                      icon: LucideIcons.mail,
                      text: "TheLizards@gmail.com",
                    ),
                    SizedBox(height: 10),
                    _ContactRow(
                      icon: LucideIcons.phone,
                      text: "+994 55 977 55 86",
                    ),
                    SizedBox(height: 10),
                    _ContactRow(
                      icon: LucideIcons.mapPin,
                      text: "Баку, Азербайджан",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Создатели проекта
            Text(
              "Создатели проекта",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 12),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    _CreatorItem(name: "Зейнал Маммедзаде"),
                    _CreatorItem(name: "Лейла Агабалаева"),
                    _CreatorItem(name: "Лейла Азизова"),
                    _CreatorItem(name: "Мурад Маммедли"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            Center(
              child: Text(
                "© 2025 The Lizards. Все права защищены.",
                style: TextStyle(
                  fontSize: 13,
                  color: colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class _CreatorItem extends StatelessWidget {
  final String name;

  const _CreatorItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(LucideIcons.user, size: 22),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
