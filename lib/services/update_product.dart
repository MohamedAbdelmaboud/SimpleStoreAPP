import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/store_services.dart';

class UpdateProductService extends StoreServices {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required String category,
    String? token,
  }) async {
    Map headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer '});
    }
    final Response response = await dio.put(
      '$baseUrl$productEndPoint/$id',
      data: {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category
      },
      options: Options(
          responseType: ResponseType.json,
          contentType: 'application/x-www-form-urlencoded',
          headers: {}),
    );
    Map<String, dynamic> data = response.data;
    print(data);
    return ProductModel.fromJsonToUpdateProduct(data);
  }
}
