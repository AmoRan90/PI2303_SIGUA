class Resources {
  int coffeeBeans;
  int milk;
  int water;
  double cash;

  Resources({
    required this.coffeeBeans,
    required this.milk,
    required this.water,
    required this.cash,
  });

  Resources copyWith({
    int? coffeeBeans,
    int? milk,
    int? water,
    double? cash,
  }) {
    return Resources(
      coffeeBeans: coffeeBeans ?? this.coffeeBeans,
      milk: milk ?? this.milk,
      water: water ?? this.water,
      cash: cash ?? this.cash,
    );
  }

  @override
  String toString() {
    return "кофе: $coffeeBeans гр | молоко: $milk мл | вода: $water мл | касса: $cash руб";
  }
}