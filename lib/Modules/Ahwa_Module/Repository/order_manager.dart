import '../../../Models/order_model.dart';
import 'order_repository.dart';

class OrderManager {
  final OrderRepository _repository;

  OrderManager(this._repository);

  void addOrder(Order order) => _repository.addOrder(order);

  void completeOrder(int index) => _repository.markOrderCompleted(index);

  List<Order> get pendingOrders => _repository.getPendingOrders();

  List<Order> get completedOrders => _repository.getCompletedOrders();

  Map<String, int> getTopSellingDrinks() {
    final drinkCounts = <String, int>{};
    for (var order in completedOrders) {
      drinkCounts.update(order.customer.drinkType.name, (value) => value + 1, ifAbsent: () => 1);
    }
    return Map.fromEntries(drinkCounts.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));
  }

  int get totalOrdersServed => completedOrders.length;

  Map<String, int> getDailyTopSellingDrinks() {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final drinkCounts = <String, int>{};

    for (var order in _repository.getCompletedOrders()) {
      if (order.createdAt.isAfter(startOfDay) && order.createdAt.isBefore(endOfDay)) {
        drinkCounts.update(order.customer.drinkType.name, (value) => value + 1, ifAbsent: () => 1);
      }
    }
    return Map.fromEntries(
        drinkCounts.entries.toList()..sort((a, b) => b.value.compareTo(a.value))
    );
  }

  int get dailyOrdersServed {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _repository.getCompletedOrders().where((order) {
      return order.createdAt.isAfter(startOfDay) && order.createdAt.isBefore(endOfDay);
    }).length;
  }

}