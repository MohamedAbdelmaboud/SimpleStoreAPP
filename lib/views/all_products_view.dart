import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/custom_text.dart';
import 'package:store_app/widgets/gridView_bulider_allProducts.dart';

class ALlProductsView extends StatelessWidget {
  const ALlProductsView({super.key});
  static String id = 'ALlProductsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const CustomText(
            'All products',
            fontSize: 25,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: const GridViewBuilderAll());
  }
}
