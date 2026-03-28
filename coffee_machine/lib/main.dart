import 'classes/coffee_machine.dart';
import 'classes/coffee_types.dart';
import 'classes/resources.dart';

void main() {
  var resources = Resources(
    coffeeBeans: 100,
    milk: 200,
    water: 500,
    cash: 0,
  );
  
  var machine = CoffeeMachine(resources);
  
  print('=== Тестирование всех видов кофе ===\n');
  
  // Проходим по всем видам кофе
  for (var type in CoffeeType.values) {
    print('--- Приготовление ${type.rusName} ---');
    print('Ресурсы до: зерна=${machine.coffeeBeans}г, молоко=${machine.milk}мл, вода=${machine.water}мл, деньги=${machine.cash}руб');
    
    machine.makeCoffee(type.coffee);
    
    print('Ресурсы после: зерна=${machine.coffeeBeans}г, молоко=${machine.milk}мл, вода=${machine.water}мл, деньги=${machine.cash}руб\n');
  }
}