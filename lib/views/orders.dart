import 'package:fintech_/models/orderStatus.dart';
import 'package:fintech_/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fintech_/widgets/sidebar_menu.dart';
import 'package:fintech_/models/order.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() {
    return _Order();
  }
}

class _Order extends State<Orders> {
  late Product product1;
  late Product product2;
  late Product product3;
  late Product product4;
  late Product product5;
  late Product product6;

  late List<Order> incomingOrders = [];
  late List<Order> outgoingOrders;

  @override
  void initState() {
    super.initState();
    product1 = Product(id: '122123', name: 'JK Rubber', price: 10.0);
    product2 = Product(id: '8764', name: 'CAW Magnet', price: 12.0);
    product3 = Product(id: '35324', name: 'SG Silicone', price: 15.0);
    product4 = Product(id: '324245', name: 'CK Headphones I', price: 100.0);
    product5 = Product(id: '82775', name: 'CK Headphones II', price: 150.0);
    product6 = Product(id: '240402', name: 'CK Headphones Pro', price: 200.0);

    incomingOrders = [
      Order(
        id: 'O121212',
        products: [product1, product2],
        quantity: 10,
        totalPrice: (product1.price * 10) + (product2.price * 10),
        status: OrderStatus.pending,
        unit: 'pcs',
      ),
      Order(
        id: 'O138484',
        products: [product1, product2, product3],
        quantity: 10,
        totalPrice: (product1.price * 10) + (product2.price * 10) + (product3.price * 10),
        status: OrderStatus.delivered,
        unit: 'pcs',
      ),
      Order(
        id: 'O1239932',
        products: [product2, product3],
        quantity: 10,
        totalPrice: (product2.price * 10) + (product3.price * 10),
        status: OrderStatus.shipped,
        unit: 'pcs',
      ),
    ];

    outgoingOrders = [
      Order(
        id: 'O194872',
        products: [product4],
        quantity: 10,
        totalPrice: (product4.price * 10),
        status: OrderStatus.delivered,
        unit: 'pcs',
      ),
      Order(
        id: 'O184844',
        products: [product4, product5, product6],
        quantity: 10,
        totalPrice: (product4.price * 10) + (product5.price * 10) + (product6.price * 10),
        status: OrderStatus.pending,
        unit: 'pcs',
      ),
      Order(
        id: 'O49952',
        products: [product5, product6],
        quantity: 10,
        totalPrice: (product5.price * 10) + (product6.price * 10),
        status: OrderStatus.shipped,
        unit: 'pcs',
      ),
      Order(
        id: 'O199872',
        products: [product4, product6],
        quantity: 10,
        totalPrice: (product4.price * 10) + (product6.price * 10),
        status: OrderStatus.pending,
        unit: 'pcs',
      ),
      Order(
        id: 'O73344',
        products: [product6],
        quantity: 10,
        totalPrice: (product6.price * 10),
        status: OrderStatus.processing,
        unit: 'pcs',
      ),
      Order(
        id: 'O88952',
        products: [product5],
        quantity: 10,
        totalPrice: (product5.price * 10),
        status: OrderStatus.delivered,
        unit: 'pcs',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders and Transactions'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.keyboard_double_arrow_down_rounded)),
              Tab(icon: Icon(Icons.keyboard_double_arrow_up_rounded)),
            ],
          ),
        ),
        drawer: const sidebarDrawer(),
        body: TabBarView(
          children: [
            OrdersList(orders: incomingOrders),
            OrdersList(orders: outgoingOrders),
          ],
        ),
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: myHeight * 0.02, horizontal: myWidth * 0.02),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          String statusText = getStatusText(order.status);
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ${order.id} / Status: $statusText',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Total Price: \$${order.totalPrice.toString()}'),
                  const SizedBox(height: 8),
                  const Text('Products:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ...order.products.map((product) => Text('${product.name} - \$${product.price}')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.processing:
        return 'Processing';
      default:
        return 'Unknown';
    }
  }
}