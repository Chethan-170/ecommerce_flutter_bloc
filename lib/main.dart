import 'package:ecommerce_flutter_bloc/screens/home/ui/blocs/product/product_bloc.dart';
import 'package:ecommerce_flutter_bloc/screens/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.orange),
        title: 'E-Commerce App',
        home: Home(),
      ),
    );
  }
}
