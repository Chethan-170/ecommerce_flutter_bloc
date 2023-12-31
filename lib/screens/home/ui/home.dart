import 'package:ecommerce_flutter_bloc/screens/home/ui/product_list.dart';
import 'package:ecommerce_flutter_bloc/screens/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'E-Commerce App',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (materialContext) => const Wishlist(),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_outline))
          ],
        ),
        body: ProductList());
  }
}
