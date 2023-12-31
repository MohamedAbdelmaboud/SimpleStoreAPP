import 'package:flutter/material.dart';
import 'package:store_app/views/all_products_view.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/views/products_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => const HomeView(),
        ProductsView.id: (context) => const ProductsView(),
        ALlProductsView.id: (context) => const ALlProductsView()
      },
    );
  }
}
