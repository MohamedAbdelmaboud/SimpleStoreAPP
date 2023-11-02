import 'package:dio/dio.dart';

class StoreServices {
  Dio dio = Dio();
  String baseUrl = 'https://fakestoreapi.com/';
  String productEndPoint = 'products';
  String categoriesEndPoint = 'products/categories';
}
