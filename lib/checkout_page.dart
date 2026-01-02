import 'package:flutter/material.dart';

import 'orders_page.dart' show OrdersPage;

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            checkoutTile("Shipping Address", "Add Address"),
            checkoutTile("Payment Method", "Select Method"),
            checkoutTile("Delivery", "Standard"),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const OrdersPage()),
                );},
                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget checkoutTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
