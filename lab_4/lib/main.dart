import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'КубГАУ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кампус КубГАУ'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/картинка2.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 50),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Кубанский государственный аграрный университет',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...List.generate(
                4,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              const Icon(
                Icons.star_half,
                color: Colors.green,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                '4.8 (177 отзывов)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Студенческий городок или так называемый кампус Кубанского ГАУ состоит '
              'из двадцати общежитий, в которых проживает более 8000 студентов, что составляет '
              '96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии '
              'полностью. В соответствии с Положением о студенческих общежитиях университета, '
              'при поселении между администрацией и студентами заключается договор найма жилого '
              'помещения. Воспитательная работа в общежитиях направлена на улучшение быта, '
              'соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в '
              'молодежной среде. Условия проживания в общежитиях университетского кампуса '
              'полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, '
              'душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для '
              'заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта '
              'студентов активно работает система студенческого самоуправления - студенческие '
              'советы организуют всю работу по самообслуживанию.',
              style: TextStyle(fontSize: 14, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}