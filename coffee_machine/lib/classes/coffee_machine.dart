import 'resources.dart';
import '../interfaces/i_coffee.dart';
import 'coffee_types.dart';

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

  bool _isAvailable(ICoffee coffee) {
    return _resources.coffeeBeans >= coffee.requiredResources.coffeeBeans &&
           _resources.water >= coffee.requiredResources.water &&
           _resources.milk >= coffee.requiredResources.milk;
  }

  void _subtractResources(ICoffee coffee) {
    _resources.coffeeBeans -= coffee.requiredResources.coffeeBeans;
    _resources.water -= coffee.requiredResources.water;
    _resources.milk -= coffee.requiredResources.milk;
  }

  bool makeCoffee(ICoffee coffee) {
    if (_isAvailable(coffee)) {
      _subtractResources(coffee);
      _resources.cash += coffee.cost;
      print('✓ ${_getCoffeeName(coffee)} готов!');
      return true;
    } else {
      print('✗ Недостаточно ресурсов для ${_getCoffeeName(coffee)}!');
      print('  Нужно: зерна=${coffee.requiredResources.coffeeBeans}г, молоко=${coffee.requiredResources.milk}мл, вода=${coffee.requiredResources.water}мл');
      return false;
    }
  }

  String _getCoffeeName(ICoffee coffee) {
    if (coffee is Espresso) return 'Эспрессо';
    if (coffee is Cappuccino) return 'Капучино';
    if (coffee is Latte) return 'Латте';
    return coffee.runtimeType.toString();
  }
  
  void showResources() {
    print('┌─────────────────────────┐');
    print('│ Текущие ресурсы:        │');
    print('│ Кофе: ${_resources.coffeeBeans.toString().padLeft(3)} г          │');
    print('│ Молоко: ${_resources.milk.toString().padLeft(3)} мл         │');
    print('│ Вода: ${_resources.water.toString().padLeft(3)} мл         │');
    print('│ Деньги: ${_resources.cash.toString().padLeft(3)} руб        │');
    print('└─────────────────────────┘');
  }
}