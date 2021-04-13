import 'package:dio/dio.dart';
import 'package:tiki_app/api/product_api.dart';

class ProductService {
  static Future browse() async {
    Products products;
    Response<Map> response =
    await Dio().get("https://api.tiki.vn/v2/widget/deals/hot");
    if (response.statusCode == 200) {
      products = Products.fromJson(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return products;
  }
}
