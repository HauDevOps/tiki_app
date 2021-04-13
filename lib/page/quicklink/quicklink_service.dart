import 'package:dio/dio.dart';
import 'package:tiki_app/api/quicklink_api.dart';

class QuickLinkService {
  static Future browse() async {
    QuickLink quickLink;
    Response<Map> response =
    await Dio().get("https://api.tiki.vn/shopping/v2/widgets/quick_link");
    if (response.statusCode == 200) {
      quickLink = QuickLink.fromJson(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return quickLink;
  }
}
