// Файл: lib/models/Espresso.dart

import 'ICoffee.dart';
import 'Resources.dart';

class Espresso implements ICoffee {
  @override
  String get name => "Эспрессо";

  @override
  int coffeeBeans() => 50;

  @override
  int milk() => 0;

  @override
  int water() => 100;

  @override
  double price() => 100.0;

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