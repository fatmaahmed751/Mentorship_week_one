import '../../../Models/order_model.dart';

abstract class OrderRepository {
  List<Order> getPendingOrders();
  List<Order> getCompletedOrders();
  void addOrder(Order order);
  void markOrderCompleted(int index);
}


