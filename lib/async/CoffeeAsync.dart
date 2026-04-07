import 'dart:async';

class CoffeeAsync {
  static Future<void> heatWater() async {
    print("start_process: water");
    await Future.delayed(Duration(seconds: 3));
    print("done_process: water");
  }

  static Future<void> brewEspresso() async {
    print("start_process: espresso");
    await Future.delayed(Duration(seconds: 5));
    print("done_process: coffee with water");
  }

  static Future<void> frothMilk() async {
    print("start_process: milk");
    await Future.delayed(Duration(seconds: 5));
    print("done_process: milk");
  }

  static Future<void> makeBlackCoffee() async {
    print("*---*");
    print("_start_");
    await heatWater();
    print("_then_");
    await brewEspresso();
    print("_end_");
  }

  static Future<void> makeMilkCoffee() async {
    print("*---*");
    print("_start_");
    await Future.wait([heatWater(), frothMilk()]);
    print("_then_");
    await brewEspresso();
    print("_end_");
  }
}