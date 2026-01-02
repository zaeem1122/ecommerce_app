import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              title: const Text("Order #12345"),
              subtitle: const Text("Delivered"),
              trailing: const Text("\$85",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
