import 'customer_model.dart';

class Order {
  final Customer customer;
  final DateTime createdAt;
  bool _isCompleted = false;

  Order({required this.customer, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now();

  bool get isCompleted => _isCompleted;

  void markAsCompleted() {
    _isCompleted = true;
  }

  @override
  String toString() {
    return 'Order for ${customer.name}: ${customer.drinkType} at ${createdAt.hour}:${createdAt.minute}${customer.specialInstructions != null ? ' - ${customer.specialInstructions}' : ''}';
  }
}
