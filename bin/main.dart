import '../lib/classes/Machine.dart';
import '../lib/models/CoffeeType.dart';

void main() async {
  print("=" * 55);
  print("     КОФЕМАШИНА - ЛАБОРАТОРНАЯ РАБОТА 11");
  print("=" * 55);
  print("(с асинхронным приготовлением)");
  print("=" * 55);
  
  Machine myCoffeeMachine = Machine.withDefaultResources();
  
  myCoffeeMachine.showStatus();
  
  print("\nПОЛЬЗОВАТЕЛЬ: Эспрессо (асинхронно)!");
  await myCoffeeMachine.makeCoffeeAsync(CoffeeType.espresso);
  myCoffeeMachine.showStatus();
  
  print("\nПОЛЬЗОВАТЕЛЬ: Капучино (асинхронно)!");
  await myCoffeeMachine.makeCoffeeAsync(CoffeeType.cappuccino);
  myCoffeeMachine.showStatus();
  
  print("\nПОЛЬЗОВАТЕЛЬ: Латте (асинхронно)!");
  await myCoffeeMachine.makeCoffeeAsync(CoffeeType.latte);
  myCoffeeMachine.showStatus();
  
  print("\n" + "=" * 55);
  print("          РАБОТА ЗАВЕРШЕНА");
  print("=" * 55);
}