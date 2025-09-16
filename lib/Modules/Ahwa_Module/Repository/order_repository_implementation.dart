import '../../../Models/order_model.dart';
import 'order_repository.dart';

class OrderRepositoryImplementation implements OrderRepository {
  final List<Order> _orders = [];

  @override
  void addOrder(Order order) => _orders.add(order);

  @override
  List<Order> getPendingOrders() => _orders.where((o) => !o.isCompleted).toList();

  @override
  List<Order> getCompletedOrders() => _orders.where((o) => o.isCompleted).toList();

  @override
  void markOrderCompleted(int index) {
    if (index >= 0 && index < _orders.length) {
      _orders[index].markAsCompleted();
    }
  }
}