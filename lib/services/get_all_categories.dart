import 'package:dio/dio.dart';
import 'package:store_app/services/store_services.dart';

class GetAllCategoriesService extends StoreServices {
  Future<List<dynamic>> getAllCategories() async {
    try {
      final Response response = await dio.get(baseUrl + categoriesEndPoint);
      List<dynamic> categories = response.data;
      return categories;
    } on DioException catch (e) {
      throw Exception(
          e.response?.data.toString() ?? 'There is an error ,Try again');
    }
  }
}
