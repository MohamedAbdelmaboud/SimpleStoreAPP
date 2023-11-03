import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/custom_card.dart';
import 'package:store_app/widgets/custom_text.dart';

class GridViewBuilderAll extends StatelessWidget {
  const GridViewBuilderAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<List<ProductModel>>? future =
        GetAllproductsService().getAllProducts();
    return FutureBuilder<List<ProductModel>>(
      future: future,
      builder: (context, snapshot) {
        List<ProductModel>? models = snapshot.data;
        if (snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.only(top: 60.0, right: 16, left: 16),
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 70,
              crossAxisSpacing: 5,
              childAspectRatio: 1.1, //W:H
            ),
            itemCount: models!.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(productModel: models[index]);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
              child: CustomText("There is an error")); //isEmpty --> No data
        } else {
          return Center(
              child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.7,
            child: const SpinKitWaveSpinner(
              color: Colors.blue,
              waveColor: Colors.blue,
              size: 75.0,
            ),
          ));
        }
      },
    );
  }
}
