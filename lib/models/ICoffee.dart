import 'Resources.dart';

abstract class ICoffee {
  String get name;
  int coffeeBeans();
  int milk();
  int water();
  double price();
  
  bool isAvailable(Resources resources) {
    return resources.coffeeBeans >= coffeeBeans() &&
           resources.milk >= milk() &&
           resources.water >= water();
  }
  
  Resources consumeResources(Resources resources) {
    print("   Расход: кофе ${coffeeBeans()}гр, молоко ${milk()}мл, вода ${water()}мл");
    print("   Стоимость: ${price()} руб");
    return resources.copyWith(
      coffeeBeans: resources.coffeeBeans - coffeeBeans(),
      milk: resources.milk - milk(),
      water: resources.water - water(),
      cash: resources.cash + price(),
    );
  }
}