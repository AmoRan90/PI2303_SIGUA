import 'ICoffee.dart';
import 'Resources.dart';

class Cappuccino implements ICoffee {
  @override
  String get name => "Капучино";

  @override
  int coffeeBeans() => 50;

  @override
  int milk() => 100;

  @override
  int water() => 80;

  @override
  double price() => 150.0;

  @override
  bool isAvailable(Resources resources) {
    return resources.coffeeBeans >= coffeeBeans() &&
           resources.milk >= milk() &&
           resources.water >= water();
  }

  @override
  Resources consumeResources(Resources resources) {
    return resources.copyWith(
      coffeeBeans: resources.coffeeBeans - coffeeBeans(),
      milk: resources.milk - milk(),
      water: resources.water - water(),
      cash: resources.cash + price(),
    );
  }
}