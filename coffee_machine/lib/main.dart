import 'classes/coffee_machine.dart';
import 'classes/coffee_types.dart';
import 'classes/resources.dart';

void main() {
  // Создаем начальные ресурсы
  var resources = Resources(
    coffeeBeans: 100,
    milk: 200,
    water: 500,
    cash: 0,
  );
  
  // Создаем экземпляр кофемашины
  var machine = CoffeeMachine(resources);
  
  // Создаем экземпляр эспрессо
  var espresso = Espresso();
  
  print('Начальное состояние: зерна = ${machine.coffeeBeans} г, деньги = ${machine.cash} руб');
  machine.makeCoffee(espresso);
  print('Состояние после: зерна = ${machine.coffeeBeans} г, деньги = ${machine.cash} руб');
}