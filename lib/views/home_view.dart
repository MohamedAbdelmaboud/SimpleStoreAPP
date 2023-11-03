import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_text.dart';
import 'package:store_app/widgets/gridView_categories.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const CustomText(
            'My Store',
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        body: const GridViewCategories());
  }
}
