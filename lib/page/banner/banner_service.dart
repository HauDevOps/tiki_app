import 'package:dio/dio.dart';
import 'package:tiki_app/api/banner_api.dart';

class BannerService {
  static Future browse() async {
    Banners banners;
    Response<Map> response =
    await Dio().get("https://api.tiki.vn/v2/home/banners/v2");
    if (response.statusCode == 200) {
      banners = Banners.fromJson(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return banners;
  }
}