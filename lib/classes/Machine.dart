import '../models/Resources.dart';
import '../models/ICoffee.dart';
import '../models/Espresso.dart';
import '../models/Cappuccino.dart';
import '../models/Latte.dart';
import '../models/CoffeeType.dart';
import '../async/CoffeeAsync.dart';

class Machine {
  Resources _resources;

  Machine({required Resources resources}) : _resources = resources;

  factory Machine.withDefaultResources() {
    return Machine(
      resources: Resources(
        coffeeBeans: 200,
        milk: 300,
        water: 500,
        cash: 0.0,
      ),
    );
  }

  int get coffeeBeans => _resources.coffeeBeans;
  int get milk => _resources.milk;
  int get water => _resources.water;
  double get cash => _resources.cash;

  Resources get resources => _resources;

  ICoffee _getCoffeeByType(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.latte:
        return Latte();
    }
  }

  bool isAvailable(CoffeeType type) {
    final coffee = _getCoffeeByType(type);
    return coffee.isAvailable(_resources);
  }

  bool makeCoffee(CoffeeType type) {
    final coffee = _getCoffeeByType(type);
    
    print("\n--- Приготовление ${coffee.name} ---");
    
    if (!coffee.isAvailable(_resources)) {
      print("Ошибка: недостаточно ресурсов!");
      return false;
    }
    
    _resources = coffee.consumeResources(_resources);
    print("${coffee.name} готов!");
    return true;
  }

  Future<bool> makeCoffeeAsync(CoffeeType type) async {
    final coffee = _getCoffeeByType(type);
    
    print("\n--- Приготовление ${coffee.name} (асинхронно) ---");
    
    if (!coffee.isAvailable(_resources)) {
      print("Ошибка: недостаточно ресурсов!");
      return false;
    }
    
    if (coffee.milk() == 0) {
      await CoffeeAsync.makeBlackCoffee();
    } else {
      await CoffeeAsync.makeMilkCoffee();
    }
    
    _resources = coffee.consumeResources(_resources);
    print("${coffee.name} готов!");
    return true;
  }

  void showStatus() {
    print("\n=== СОСТОЯНИЕ КОФЕМАШИНЫ ===");
    print(_resources.toString());
    print("==============================");
  }
}