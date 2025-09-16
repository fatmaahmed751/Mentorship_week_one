abstract class Drink {
  String get name;
  double get price;
}

class Shai extends Drink {
  @override
  String get name => 'Shai';
  @override
  double get price => 10.0;
}

class TurkishCoffee extends Drink {
  @override
  String get name => 'TurkishCoffee';
  @override
  double get price => 15.0;
}

class HibiscusTea extends Drink {
  @override
  String get name => 'HibiscusTea';
  @override
  double get price => 8.0;
}