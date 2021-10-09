import 'package:dio/dio.dart';
import '../../constants.dart';

class ProductWebServices {
  Dio dio;

  ProductWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
