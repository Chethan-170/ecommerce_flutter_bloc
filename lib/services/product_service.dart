import 'dart:convert';

import 'package:ecommerce_flutter_bloc/screens/home/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<ProductModel>> fetchProducts(
      {Map filter = const {}}) async {
    String url = 'https://fakestoreapi.com/produc';
    List<ProductModel> list = [
      ProductModel.fromJson({
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description":
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {"rate": 3.9, "count": 120}
      })
    ];
    // var response = await http.get(Uri.parse(url));
    // List responseList = jsonDecode(response.body) as List;
    // responseList.forEach((item) {
    //   ProductModel product = ProductModel.fromJson(item);
    //   list.add(product);
    // });
    return Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        return list;
      },
    );
  }
}
