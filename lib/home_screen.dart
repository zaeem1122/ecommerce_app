import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, String>> popularProducts = [
    {
      "title": "Premium Hoodie",
      "price": "\$45",
      "image":
      "https://images.unsplash.com/photo-1520975916090-3105956dac38",
    },
    {
      "title": "Street T-Shirt",
      "price": "\$25",
      "image":
      "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
    },
    {
      "title": "Winter Jacket",
      "price": "\$85",
      "image":
      "https://images.unsplash.com/photo-1551028719-00167b16eac5",
    },
    {
      "title": "Sports Cap",
      "price": "\$18",
      "image":
      "https://images.unsplash.com/photo-1691256676359-20e5c6d4bc92?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "StitchCraft",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Search
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search products",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    "New Collection\nFlat 30% OFF",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Popular Products
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: popularProducts.length,
              itemBuilder: (context, index) {
                final product = popularProducts[index];
                return ProductCard(
                  title: product['title']!,
                  price: product['price']!,
                  imageUrl: product['image']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailPage(
            title: title,
            price: price,
            imageUrl: imageUrl,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(price,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
