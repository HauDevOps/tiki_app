import 'package:tiki_app/api/product_api.dart';
import 'package:tiki_app/page/product/product_service.dart';

class Repository {
  Future<Products> callApi() async {
    return await ProductService.browse();
  }
}
