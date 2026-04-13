import 'package:flutter/material.dart';
import 'SimpleList.dart';
import 'InfinityList.dart';
import 'InfinityMathList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная 5',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _navigateWithoutAnimation(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Лабораторная работа 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateWithoutAnimation(context, const SimpleList());
              },
              child: const Text('1. Простой список'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _navigateWithoutAnimation(context, const InfinityList());
              },
              child: const Text('2. Бесконечный список'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _navigateWithoutAnimation(context, const InfinityMathList());
              },
              child: const Text('3. Степени числа 2'),
            ),
          ],
        ),
      ),
    );
  }
}