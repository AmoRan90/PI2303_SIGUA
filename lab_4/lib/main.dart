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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLiked = false;
  int _likeCount = 41;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

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
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isLiked) {
                          _likeCount--;
                        } else {
                          _likeCount++;
                        }
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                  Text('$_likeCount'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(Icons.call, 'Позвонить', () {
                _showMessage('Звонок в приёмную комиссию');
              }),
              _buildActionButton(Icons.map, 'Маршрут', () {
                _showMessage('Строим маршрут до КубГАУ');
              }),
              _buildActionButton(Icons.share, 'Поделиться', () {
                _showMessage('Поделиться информацией');
              }),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Контакты',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildContactRow(Icons.location_on, '350044, г. Краснодар, ул. Калинина, 13'),
                  const SizedBox(height: 4),
                  _buildContactRow(Icons.phone, '+7 (861) 221-58-88'),
                  const SizedBox(height: 4),
                  _buildContactRow(Icons.email, 'mail@kubsau.ru'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.green,
            size: 30,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.green,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}