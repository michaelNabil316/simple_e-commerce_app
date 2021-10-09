import 'package:flitill/Data/models/product_model.dart';
import 'package:flitill/Data/web_services/web_services.dart';

class ProductRepository {
  final ProductWebServices productWebServices;

  ProductRepository(this.productWebServices);
  Future<List<Product>> getAllProducts() async {
    final characters = await productWebServices.getAllProducts();
    return characters.map((element) => Product.fromJson(element)).toList();
  }
}
