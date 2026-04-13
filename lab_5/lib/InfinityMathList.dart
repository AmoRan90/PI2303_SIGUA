import 'package:flutter/material.dart';
import 'dart:math';

class InfinityMathList extends StatelessWidget {
  const InfinityMathList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Степени числа 2')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          int result = pow(2, index).toInt();
          return ListTile(
            title: Text('2 ^ $index = $result'),
          );
        },
      ),
    );
  }
}