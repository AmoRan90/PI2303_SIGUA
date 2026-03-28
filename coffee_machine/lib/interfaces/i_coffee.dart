import '../classes/resources.dart';

abstract class ICoffee {
  // Необходимые ресурсы для приготовления
  Resources get requiredResources;
  
  // Стоимость напитка
  int get cost;
}