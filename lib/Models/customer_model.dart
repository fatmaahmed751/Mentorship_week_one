import 'drink_model.dart';

class Customer{
  final String name;
  final Drink drinkType;
  final String? specialInstructions;

  Customer(this.name, this.drinkType, this.specialInstructions);
}