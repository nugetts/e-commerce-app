import 'package:ecommerence_app/components/my_button.dart';
import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            //логотип
            ClipOval(
              child: Image.asset(
                'lib/design/logo_new.png',
                height: 300,
                width: 300,
              ),
            ),

            const SizedBox(height: 25),
        
        
            //название
            Text(
              'Добро пожаловать!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
        
            const SizedBox(height: 10),
            //описание
            Text(        
              "В нашем магазине товары высочайшего качества",
            ),

            const SizedBox(height: 25),
        
        
            //кнопка начать
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'), 
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: 
                    [Colors.blue, Colors.purple]
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}