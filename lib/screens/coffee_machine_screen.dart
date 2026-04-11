import 'package:flutter/material.dart';
import '../app_state.dart';
import '../models/Enums.dart';
import '../models/ICoffee.dart';
import '../services/NotificationService.dart';
import '../widgets/resource_display.dart';

class CoffeeMachineScreen extends StatefulWidget {
  const CoffeeMachineScreen({super.key});

  @override
  State<CoffeeMachineScreen> createState() => _CoffeeMachineScreenState();
}

class _CoffeeMachineScreenState extends State<CoffeeMachineScreen> {
  late AppState _appState;
  late NotificationService _notifications;
  int selectedCoffee = 0;
  bool isMakingCoffee = false;

  final TextEditingController _moneyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appState = AppState();
    _notifications = NotificationService();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifications.setContext(context);
    });
  }

  CoffeeType _getCoffeeTypeFromIndex(int index) {
    switch (index) {
      case 0:
        return CoffeeType.espresso;
      case 1:
        return CoffeeType.americano;
      case 2:
        return CoffeeType.cappuccino;
      case 3:
        return CoffeeType.latte;
      default:
        return CoffeeType.espresso;
    }
  }

  String _getCoffeeName(int index) {
    switch (index) {
      case 0:
        return 'Эспрессо';
      case 1:
        return 'Американо';
      case 2:
        return 'Капучино';
      case 3:
        return 'Латте';
      default:
        return 'Кофе';
    }
  }

  int _getCoffeePrice(int index) {
    ICoffee? coffee = _appState.controller.createCoffee(
      _getCoffeeTypeFromIndex(index),
    );
    return coffee?.cash() ?? 0;
  }

  Future<void> _makeCoffee() async {
    if (isMakingCoffee) return;

    setState(() {
      isMakingCoffee = true;
    });

    CoffeeType type = _getCoffeeTypeFromIndex(selectedCoffee);

    bool success = await _appState.controller.makeCoffee(type);

    setState(() {
      isMakingCoffee = false;
    });

    if (success) {
      setState(() {});
    }
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
                ResourceDisplay(
                  coffeeBeans: _appState.resources.coffeeBeans,
                  milk: _appState.resources.milk,
                  water: _appState.resources.water,
                ),

                const SizedBox(height: 24),

                const Center(
                  child: Text(
                    'Варка кофе',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Баланс: ${_appState.resources.cash} руб',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Ассортимент кофе:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 8),

                _buildCoffeeOption(0, _getCoffeeName(0), _getCoffeePrice(0)),
                _buildCoffeeOption(1, _getCoffeeName(1), _getCoffeePrice(1)),
                _buildCoffeeOption(2, _getCoffeeName(2), _getCoffeePrice(2)),
                _buildCoffeeOption(3, _getCoffeeName(3), _getCoffeePrice(3)),

                const SizedBox(height: 24),

                Center(
                  child: ElevatedButton(
                    onPressed: isMakingCoffee ? null : _makeCoffee,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(121, 85, 72, 1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: isMakingCoffee
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'ПРИГОТОВИТЬ',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Пополнить баланс:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _moneyController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Сумма',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              if (_moneyController.text.isNotEmpty) {
                                int amount = int.tryParse(_moneyController.text) ?? 0;
                                if (amount > 0) {
                                  setState(() {
                                    _appState.resources.cash += amount;
                                  });
                                  _notifications.showSuccess('$amount руб добавлено');
                                  _moneyController.clear();
                                } else {
                                  _notifications.showError('Введите корректную сумму');
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Внести'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeOption(int index, String name, int price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: selectedCoffee == index ? Colors.brown[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Radio<int>(
            value: index,
            groupValue: selectedCoffee,
            onChanged: isMakingCoffee
                ? null
                : (value) {
                    setState(() {
                      selectedCoffee = value!;
                    });
                  },
            activeColor: Colors.brown,
          ),
          Expanded(
            child: Text(
              '$name - $price руб',
              style: TextStyle(
                fontSize: 16,
                fontWeight: selectedCoffee == index ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _moneyController.dispose();
    super.dispose();
  }
}