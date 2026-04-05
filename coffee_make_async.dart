import 'dart:async';

class CoffeeMaker {
  Future<void> heatWater() async {
    print('start_process: water');
    await Future.delayed(Duration(seconds: 3));
    print('done_process: water');
  }

  Future<void> brewCoffee() async {
    print('start_process: espresso');
    await Future.delayed(Duration(seconds: 5));
    print('done_process: coffee with water');
  }

  Future<void> frothMilk() async {
    print('start_process: milk');
    await Future.delayed(Duration(seconds: 5));
    print('done_process: milk');
  }

  Future<void> mixCoffeeAndMilk() async {
    await Future.delayed(Duration(seconds: 3));
  }
}