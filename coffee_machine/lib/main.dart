import 'dart:io';
import 'classes/coffee_machine.dart';
import 'classes/coffee_types.dart';
import 'classes/resources.dart';


void main() {
  // Начальные ресурсы
  var resources = Resources(
    coffeeBeans: 200,
    milk: 500,
    water: 1000,
    cash: 0,
  );
  
  var machine = CoffeeMachine(resources);
  
  print('╔═══════════════════════════════════╗');
  print('║     Кофемашина "Домашний бариста" ║');
  print('╚═══════════════════════════════════╝');
  
  while (true) {
    print('\n');
    machine.showResources();
    
    print('\n--- Меню ---');
    // Динамическое отображение меню из перечисления
    for (var i = 0; i < CoffeeType.values.length; i++) {
      var type = CoffeeType.values[i];
      var coffee = type.coffee;
      print('${i + 1}. ${type.rusName} (${coffee.cost} руб)');
    }
    print('0. Выход');
    print('-----------');
    
    stdout.write('Ваш выбор: ');
    var input = stdin.readLineSync();
    
    // Выход из программы
    if (input == '0') {
      print('\nДо свидания! Спасибо, что воспользовались кофемашиной.');
      break;
    }
    
    // Обработка выбора
    int? choice = int.tryParse(input ?? '');
    if (choice != null && choice > 0 && choice <= CoffeeType.values.length) {
      var selectedType = CoffeeType.values[choice - 1];
      print('\n--- Приготовление ${selectedType.rusName} ---');
      machine.makeCoffee(selectedType.coffee);
    } else {
      print('\nОшибка: неверный выбор. Пожалуйста, выберите пункт из меню.');
    }
  }
}