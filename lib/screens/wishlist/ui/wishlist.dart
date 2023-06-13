import 'package:ecommerce_flutter_bloc/screens/wishlist/ui/product_list.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: ProductList(),
    );
  }
}
