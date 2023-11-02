import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_field.dart';
import 'package:store_app/widgets/custom_text.dart';
import 'package:store_app/widgets/snake_bar.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  String? productName;

  String? desc;

  String? price;

  String? image;

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 40,
              blurStyle: BlurStyle.normal,
            ),
          ]),
          child: Card(
            
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RatingBarIndicator(
                      itemSize: 20,
                      rating: widget.productModel.ratingModel!.rate.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    CustomText(
                      widget.productModel.title,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          r'$ ' '${widget.productModel.price.toString()}',
                          fontSize: 16,
                        ),
                        InkWell(
                          onTap: () {
                            isFavorite ? isFavorite = false : isFavorite = true;
                            setState(() {});
                          },
                          child: isFavorite
                              ? const Icon(
                                  size: 30,
                                  Icons.favorite_outlined,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  size: 30,
                                  Icons.favorite_outline,
                                  color: Colors.grey,
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
          //padding
          bottom: 100,
          left: 65,
          child: InkWell(
            onTap: () {
              showMyDialog(context);
            },
            child: Image.network(
              widget.productModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showMyDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const CustomText(
          'Update a product',
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomField(
              hintText: 'Product Name',
              onChanged: (value) {
                productName = value;
              },
            ),
            CustomField(
              hintText: 'description',
              onChanged: (value) {
                desc = value;
              },
            ),
            CustomField(
              keyboardType: TextInputType.number,
              hintText: 'price',
              onChanged: (value) {
                price = value;
              },
            ),
            CustomField(
              hintText: 'image',
              onChanged: (value) {
                image = value;
              },
            ),
          ],
        ),
        actions: [
          CustomButton(
              text: 'Update',
              onPressed: () {
                updateProduct();
                Navigator.pop(context);
                showSnakeBar(context, 'Product updated successfully');
              }),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void updateProduct() {
    UpdateProductService().updateProduct(
        id: widget.productModel.id,
        title: productName == null ? widget.productModel.title : productName!,
        price: price == null ? widget.productModel.price : price!,
        description: desc == null ? widget.productModel.description : desc!,
        image: image == null ? widget.productModel.image : image!,
        category: widget.productModel.category);
  }
}
