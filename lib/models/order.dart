import 'package:fintech_/models/product.dart';
import 'package:fintech_/models/orderStatus.dart';

class Order {
  final String id;
  final List<Product> products;
  final int quantity;
  final String unit;
  final double totalPrice;
  final OrderStatus status;

  Order({
    required this.id,
    required this.products,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    required this.unit,
  });

  // Define copyWith method
  Order copyWith({
    String? id,
    List<Product>? products,
    int? quantity,
    String? unit,
    double? totalPrice,
    OrderStatus? status,
  }) {
    return Order(
      id: id ?? this.id,
      products: products ?? this.products,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }
}
