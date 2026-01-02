import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shipping Address")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: "Full Name")),
            TextField(decoration: const InputDecoration(labelText: "Phone")),
            TextField(decoration: const InputDecoration(labelText: "Address")),
            TextField(decoration: const InputDecoration(labelText: "City")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Save Address"),
            ),
          ],
        ),
      ),
    );
  }
}
