// Правильные импорты - без указания имени проекта
import 'classes/coffee_machine.dart';
import 'classes/resources.dart';

void main() {
  var resources = Resources(
    coffeeBeans: 100,
    milk: 200,
    water: 500,
    cash: 0,
  );
  
  var machine = CoffeeMachine(resources);
  
  print('Начальное состояние: зерна = ${machine.coffeeBeans} г');
  machine.makingCoffee();
  print('Состояние после: зерна = ${machine.coffeeBeans} г');
}