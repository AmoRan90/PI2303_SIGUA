import '../interfaces/i_coffee.dart';
import 'resources.dart';

class Espresso implements ICoffee {
  @override
  Resources get requiredResources => Resources(
    coffeeBeans: 50,
    milk: 0,
    water: 100,
    cash: 0,
  );

  @override
  int get cost => 100;
}

class Cappuccino implements ICoffee {
  @override
  Resources get requiredResources => Resources(
    coffeeBeans: 40,  
    milk: 150,        
    water: 50,       
    cash: 0,
  );

  @override
  int get cost => 150; 
}

class Latte implements ICoffee {
  @override
  Resources get requiredResources => Resources(
    coffeeBeans: 40,  
    milk: 200,        
    water: 50,        
    cash: 0,
  );

  @override
  int get cost => 180; 
}

// Перечисление всех доступных видов кофе
enum CoffeeType {
  espresso,
  cappuccino,
  latte,
}

// Расширение для удобного получения экземпляра кофе по типу
extension CoffeeTypeExtension on CoffeeType {
  ICoffee get coffee {
    switch (this) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.latte:
        return Latte();
    }
  }
  
  String get rusName {
    switch (this) {
      case CoffeeType.espresso:
        return 'Эспрессо';
      case CoffeeType.cappuccino:
        return 'Капучино';
      case CoffeeType.latte:
        return 'Латте';
    }
  }
}