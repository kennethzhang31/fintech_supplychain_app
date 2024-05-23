import 'package:flutter/material.dart';
import 'package:fintech_/models/product.dart';
import 'package:fintech_/models/order.dart';
import 'package:fintech_/models/orderStatus.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;
  Future<void> fetchOrders() async {
    _orders = await _fetchOrdersFromBackend();
    notifyListeners();
  }

  Future<void> createOrder(List<Product> products) async {
    final newOrder = Order(
      id: UniqueKey().toString(),
      products: products,
      quantity: products.length,
      totalPrice: products.fold(0, (sum, product) => sum + product.price),
      status: OrderStatus.pending,
      unit: 'pcs',
    );
    _orders.add(newOrder);
    notifyListeners();
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    final index = _orders.indexWhere((order) => order.id == orderId);
    if (index != -1) {
      _orders[index] = _orders[index].copyWith(status: status);
      notifyListeners();
    }
  }

  Future<List<Order>> _fetchOrdersFromBackend() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Order(
        id: '1',
        products: [Product(id: '1', name: 'Product 1', price: 10.0)],
        quantity: 1,
        totalPrice: 10.0,
        status: OrderStatus.pending,
        unit: 'pcs',
      ),
      Order(
        id: '2',
        products: [Product(id: '2', name: 'Product 2', price: 20.0)],
        quantity: 1,
        totalPrice: 20.0,
        status: OrderStatus.processing,
        unit: 'pcs',
      ),
    ];
  }
}
