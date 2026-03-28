import '../classes/resources.dart';

// Интерфейс для всех видов кофе
abstract class ICoffee {
  // Необходимые ресурсы для приготовления
  Resources get requiredResources;
  
  // Стоимость напитка
  int get cost;
}