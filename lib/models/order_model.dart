import 'package:flutter/cupertino.dart';

class Order with ChangeNotifier {
  final int orderNumber;
  final String weight;
  final int number;
  final String cylinderType;

  Order(
      {required this.cylinderType,
      required this.number,
      required this.orderNumber,
      required this.weight});
}

class Orders with ChangeNotifier {
  List<Order> orders = [];

  // List<Order> get orders {
  //   return [..._orders];
  // }

  void addOrder(Order order) {
    final newOrder = Order(
      cylinderType: order.cylinderType,
      number: order.number,
      orderNumber: order.orderNumber,
      weight: order.weight,
    );
    orders.add(newOrder);
    notifyListeners();
  }

  // void fetchOrder() {
  //   fetchedOrder.add(Order(cylinderType: cylinderType, number: number, orderNumber: orderNumber, weight: weight))
  // }
}
