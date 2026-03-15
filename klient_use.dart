import 'dart:io';
import 'classes/Machine.dart';

void main() {
  Machine machine = Machine(100, 200, 300, 500);

  print('УПРАВЛЕНИЕ КОФЕМАШИНОЙ');

  bool isWorking = true;

  while (isWorking) {
    print('\nТекущие ингредиенты:');
    print('Кофе: ${machine.coffeeBeans}гр');
    print('Молоко: ${machine.milk}мл');
    print('Вода: ${machine.water}мл');
    print('Деньги: ${machine.cash}руб');
    
    print('\nДоступные команды:');
    print('1 - Приготовить эспрессо');
    print('2 - Добавить ингредиенты');
    print('0 - Выйти из программы');

    stdout.write('Введите команду: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        machine.makingCoffee();
        break;

      case '2':
        print('\nДОБАВЛЕНИЕ ИНГРЕДИЕНТОВ');
        
        stdout.write('Введите количество кофейных зерен(гр): ');
        int coffee = int.parse(stdin.readLineSync() ?? '0');

        stdout.write('Введите количество молока(мл): ');
        int milk = int.parse(stdin.readLineSync() ?? '0');

        stdout.write('Введите количество воды(мл): ');
        int water = int.parse(stdin.readLineSync() ?? '0');

        machine.coffeeBeans += coffee;
        machine.milk += milk;
        machine.water += water;
        
        print('Ингредиенты добавлены');
        break;

      case '0':
        print('Программа завершена');
        isWorking = false;
        break;

      default:
        print('Неизвестная команда');
    }
  }
}