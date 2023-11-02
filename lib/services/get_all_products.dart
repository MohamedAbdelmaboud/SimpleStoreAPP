import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/store_services.dart';

class GetAllproductsService extends StoreServices {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final Response response = await dio.get(baseUrl + productEndPoint);
      List json = response.data;
      List<ProductModel> models = List.generate(
          json.length, (index) => ProductModel.fromJson(json[index]));
      return models;
    } on DioException catch (e) {
      throw Exception(
          e.response?.data.toString() ?? 'There is an error ,Try again');
    }
  }
}
