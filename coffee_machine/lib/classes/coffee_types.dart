import '../interfaces/i_coffee.dart';
import 'resources.dart';

// Класс Эспрессо - реализует интерфейс ICoffee
class Espresso implements ICoffee {
  @override
  Resources get requiredResources => Resources(
    coffeeBeans: 50,  // 50 г зерен
    milk: 0,          // молоко не требуется
    water: 100,       // 100 мл воды
    cash: 0,
  );

  @override
  int get cost => 100; // стоимость 100 руб
}