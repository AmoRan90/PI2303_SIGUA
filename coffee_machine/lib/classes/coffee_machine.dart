import 'resources.dart';
import '../interfaces/i_coffee.dart';

// Класс кофемашины с поддержкой интерфейса ICoffee
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
      print('${_getCoffeeName(coffee)} готов!');
      return true;
    } else {
      print('Недостаточно ресурсов для ${_getCoffeeName(coffee)}!');
      return false;
    }
  }

  String _getCoffeeName(ICoffee coffee) {
    return coffee.runtimeType.toString();
  }
}