import 'package:tiki_app/api/quicklink_api.dart';
import 'package:tiki_app/page/quicklink/quicklink_service.dart';

class Repository {
  Future<QuickLink> callApi() async {
    return await QuickLinkService.browse();
  }
}
