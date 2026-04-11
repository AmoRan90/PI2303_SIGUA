import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_machine_app/main.dart';

void main() {
  testWidgets('Приложение запускается и отображает заголовок', (WidgetTester tester) async {
    await tester.pumpWidget(const CoffeeMachineApp());
    expect(find.text('Кофемашина'), findsOneWidget);
  });

  testWidgets('Приложение имеет 3 вкладки', (WidgetTester tester) async {
    await tester.pumpWidget(const CoffeeMachineApp());
    expect(find.text('Эспрессо'), findsOneWidget);
    expect(find.text('Капучино'), findsOneWidget);
    expect(find.text('Латте'), findsOneWidget);
  });

  testWidgets('Начальные ресурсы отображаются корректно', (WidgetTester tester) async {
    await tester.pumpWidget(const CoffeeMachineApp());
    expect(find.text('Кофе'), findsOneWidget);
    expect(find.text('Молоко'), findsOneWidget);
    expect(find.text('Вода'), findsOneWidget);
    expect(find.text('Выручка'), findsOneWidget);
  });
}