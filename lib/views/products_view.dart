import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/custom_text.dart';
import 'package:store_app/widgets/girdView_bulider.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static String id = 'ProductsView';
  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const CustomText(
            'New trend',
            fontSize: 25,
          ).pacifico(),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: GridViewBuilder(categoryName: categoryName));
  }
}
