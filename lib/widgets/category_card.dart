import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/widgets/custom_text.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: categoryModel.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 210,
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        categoryModel.categoryName,
                        fontSize: 15,
                      ).pacifico(),
                    ],
                  ),
                )),
          ),
          Positioned(
              bottom: 80,
              left: 50,
              child: Image.asset(
                categoryModel.imagePath,
                height: 110,
              ))
        ],
      ),
    );
  }
}
