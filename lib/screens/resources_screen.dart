import 'package:flutter/material.dart';
import '../app_state.dart';
import '../services/NotificationService.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  late AppState _appState;
  late NotificationService _notifications;

  final TextEditingController _coffeeController = TextEditingController();
  final TextEditingController _milkController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _cashController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appState = AppState();
    _notifications = NotificationService();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifications.setContext(context);
    });
  }

  void _addResources() {
    int coffee = int.tryParse(_coffeeController.text) ?? 0;
    int milk = int.tryParse(_milkController.text) ?? 0;
    int water = int.tryParse(_waterController.text) ?? 0;
    int cash = int.tryParse(_cashController.text) ?? 0;

    if (coffee == 0 && milk == 0 && water == 0 && cash == 0) {
      _notifications.showError('Введите значения для добавления');
      return;
    }

    setState(() {
      if (coffee > 0) _appState.resources.coffeeBeans += coffee;
      if (milk > 0) _appState.resources.milk += milk;
      if (water > 0) _appState.resources.water += water;
      if (cash > 0) _appState.resources.cash += cash;
    });

    _coffeeController.clear();
    _milkController.clear();
    _waterController.clear();
    _cashController.clear();

    FocusManager.instance.primaryFocus?.unfocus();

    _notifications.showSuccess('Ресурсы добавлены');
  }

  void _clearInputs() {
    _coffeeController.clear();
    _milkController.clear();
    _waterController.clear();
    _cashController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    _notifications.showInfo('Поля очищены');
  }

  @override
  Widget build(BuildContext context) {
    _notifications.setContext(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Управление ресурсами/ингридиентами',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.brown[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildResourceLine(
                        'Кофе в зернах:',
                        '${_appState.resources.coffeeBeans} г',
                        Icons.coffee,
                      ),
                      const Divider(),
                      _buildResourceLine(
                        'Молоко:',
                        '${_appState.resources.milk} мл',
                        Icons.local_drink,
                      ),
                      const Divider(),
                      _buildResourceLine(
                        'Вода:',
                        '${_appState.resources.water} мл',
                        Icons.water_drop,
                      ),
                      const Divider(),
                      _buildResourceLine(
                        'Деньги:',
                        '${_appState.resources.cash} руб',
                        Icons.attach_money,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'ДОБАВИТЬ РЕСУРСЫ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                _buildResourceInput('Зерна Кофе (г)', _coffeeController, Icons.coffee),
                const SizedBox(height: 8),
                _buildResourceInput('Молоко (мл)', _milkController, Icons.local_drink),
                const SizedBox(height: 8),
                _buildResourceInput('Вода (мл)', _waterController, Icons.water_drop),
                const SizedBox(height: 8),
                _buildResourceInput('Деньги (руб)', _cashController, Icons.attach_money),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _addResources,
                        icon: const Icon(Icons.add),
                        label: const Text('Добавить'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _clearInputs,
                        icon: const Icon(Icons.clear),
                        label: const Text('Очистить'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResourceLine(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.brown),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceInput(String hint, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.brown),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }

  @override
  void dispose() {
    _coffeeController.dispose();
    _milkController.dispose();
    _waterController.dispose();
    _cashController.dispose();
    super.dispose();
  }
}