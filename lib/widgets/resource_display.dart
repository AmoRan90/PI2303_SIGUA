import 'package:flutter/material.dart';

class ResourceDisplay extends StatelessWidget {
  final int coffeeBeans;
  final int milk;
  final int water;

  const ResourceDisplay({
    super.key,
    required this.coffeeBeans,
    required this.milk,
    required this.water,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(121, 85, 72, 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildResourceItem('ЗЕРНА КОФЕ', coffeeBeans, const Color.fromARGB(255, 255, 255, 255)),
          _buildResourceItem('МОЛОКО', milk, Colors.white),
          _buildResourceItem('ВОДА', water, const Color.fromARGB(255, 255, 255, 255)),
        ],
      ),
    );
  }

  Widget _buildResourceItem(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}