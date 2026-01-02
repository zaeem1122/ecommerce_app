import 'package:flutter/material.dart';

import 'address_page.dart';
import 'login_page.dart';
import 'orders_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 👤 Profile Header
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "John Doe",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "john@example.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // ⚙ Profile Options
            profileTile(
              Icons.shopping_bag,
              "My Orders",
                  () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OrdersPage()),
                  ),
            ),

            profileTile(
              Icons.location_on,
              "Shipping Address",
                  () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddressPage()),
                  ),
            ),

            profileTile(
              Icons.logout,
              "Logout",
                  () =>
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget profileTile(IconData icon,
      String title,
      VoidCallback onTap,) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}