import 'coffee_make_async.dart';

void main() async {
  final maker = CoffeeMaker.create();

  await maker.makeCoffeeWithoutMilk();

  print('');

  await maker.makeCoffeeWithMilk();
}