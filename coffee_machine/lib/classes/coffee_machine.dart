import 'resources.dart';

class CoffeeMachine {
  Resources _resources;

  CoffeeMachine(this._resources);
 
  int get coffeeBeans => _resources.coffeeBeans;
  int get milk => _resources.milk;
  int get water => _resources.water;
  int get cash => _resources.cash;

  set coffeeBeans(int value) => _resources.coffeeBeans = value;
  set milk(int value) => _resources.milk = value;
  set water(int value) => _resources.water = value;
  set cash(int value) => _resources.cash = value;
  
  bool isAvailable() {
    return _resources.coffeeBeans >= 50 && _resources.water >= 100;
  }

  void subtractResources() {
    _resources.coffeeBeans -= 50;
    _resources.water -= 100;
  }

  void makingCoffee() {
    if (isAvailable()) {
      subtractResources();
      print('Эспрессо готов!');
    } else {
      print('Недостаточно ресурсов!');
    }
  }
}