import 'package:flutter/material.dart';
import 'package:fintech_/widgets/sidebar_menu.dart';
import 'package:fintech_/models/product.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Product> inventoryProducts = [
      Product(id: '324245', name: 'CK Headphones I', price: 100.0),
      Product(id: '82775', name: 'CK Headphones II', price: 150.0),
      Product(id: '240402', name: 'CK Headphones Pro', price: 200.0),
    ];

    final Map<String, int> inventoryQuantities = {
      '324245': 50,
      '82775': 30,
      '240402': 20,
    };

    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      drawer: const sidebarDrawer(),
      body: ListView.builder(
        itemCount: inventoryProducts.length,
        itemBuilder: (context, index) {
          final product = inventoryProducts[index];
          final quantity = inventoryQuantities[product.id] ?? 0;

          return Container(
            width: myWidth * 0.7,
            margin: EdgeInsets.symmetric(horizontal: myWidth * 0.05, vertical: myHeight * 0.007),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(product.name),
                    Text('Price: \$${product.price.toString()}\nQuantity: $quantity'),
                  ]
                )
              )
              
              
            ),
          );
        },
      ),
    );
  }
}
