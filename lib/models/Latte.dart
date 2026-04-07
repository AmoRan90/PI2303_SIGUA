import 'ICoffee.dart';
import 'Resources.dart';

class Latte implements ICoffee {
  @override
  String get name => "Латте";

  @override
  int coffeeBeans() => 50;

  @override
  int milk() => 150;

  @override
  int water() => 70;

  @override
  double price() => 170.0;

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