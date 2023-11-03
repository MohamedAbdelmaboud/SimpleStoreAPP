import 'package:flutter/material.dart';
import 'package:store_app/constants/assets.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/views/all_products_view.dart';
import 'package:store_app/views/products_view.dart';
import 'package:store_app/widgets/category_card.dart';

class GridViewCategories extends StatelessWidget {
  GridViewCategories({super.key});
  String men = "men's clothing";
  String women = "women's clothing";
  String jewelery = 'jewelery';
  String electronics = 'electronics';
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryModels = [
      CategoryModel(() {
        Navigator.pushNamed(context, ALlProductsView.id);
      }, imagePath: Assets.assetsImagesAll, categoryName: 'All products'),
      CategoryModel(() {
        pushToProductView(context, arguments: electronics);
      },
          imagePath: Assets.assetsImagesElectronics,
          categoryName: 'Electronics'),
      CategoryModel(() {
        pushToProductView(context, arguments: men);
      }, imagePath: Assets.assetsImagesMan, categoryName: "Men's Clothing"),
      CategoryModel(() {
        pushToProductView(context, arguments: women);
      }, imagePath: Assets.assetsImagesWomen, categoryName: "Women's Clothing"),
      CategoryModel(() {
        pushToProductView(context, arguments: jewelery);
      }, imagePath: Assets.assetsImagesJewelry, categoryName: 'Jewelry'),
    ];
    return GridView.builder(
      padding: const EdgeInsets.only(top: 90.0, right: 16, left: 16),
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 70,
        crossAxisSpacing: 15,
        childAspectRatio: 1.3,
      ),
      itemCount: categoryModels.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryCard(categoryModel: categoryModels[index]);
      },
    );
  }

  void pushToProductView(BuildContext context, {Object? arguments}) {
    Navigator.pushNamed(context, ProductsView.id, arguments: arguments);
  }
}
