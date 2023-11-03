import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/store_services.dart';

class GetCategoriyProductService extends StoreServices {
  Future<List<ProductModel>> getCategoryProduct(
      {required String? categoryName}) async {
    try {
      final Response response =
          await dio.get('${baseUrl}products/category/$categoryName');
      List json = response.data;
      List<ProductModel> models =
          List.generate(json.length, (index) => ProductModel.fromJson(json[index]));
      return models;
    } on DioException catch (e) {
      throw Exception(
          e.response?.data.toString() ?? 'There is an error ,Try again');
    }
  }
}
