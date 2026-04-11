import 'dart:async';

class CoffeeMaker {
  CoffeeMaker() {
    print('Инициализация кофемашины...');
  }

  factory CoffeeMaker.create() {
    print('Создание кофемашины через фабричный метод');
    return CoffeeMaker();
  }

  Future<void> heatWater({Function(String)? onStatus}) async {
    onStatus?.call('Нагрев воды...');
    print('Нагрев воды...');
    await Future.delayed(const Duration(seconds: 2));
    onStatus?.call('Вода нагрета до 95C');
    print('Вода нагрета до 95C');
  }

  Future<void> brewCoffee({Function(String)? onStatus}) async {
    onStatus?.call('Заваривание кофе...');
    print('Заваривание кофе...');
    await Future.delayed(const Duration(seconds: 3));
    onStatus?.call('Кофе заварен');
    print('Кофе заварен');
  }

  Future<void> frothMilk({Function(String)? onStatus}) async {
    onStatus?.call('Взбивание молока...');
    print('Взбивание молока...');
    await Future.delayed(const Duration(seconds: 2));
    onStatus?.call('Молоко взбито в пену');
    print('Молоко взбито в пену');
  }

  Future<void> mixCoffeeAndMilk({Function(String)? onStatus}) async {
    onStatus?.call('Смешивание кофе с молоком...');
    print('Смешивание кофе с молоком...');
    await Future.delayed(const Duration(seconds: 1));
    onStatus?.call('Кофе смешан с молоком');
    print('Кофе смешан с молоком');
  }
}