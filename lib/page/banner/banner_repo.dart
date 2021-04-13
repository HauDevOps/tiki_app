import 'package:tiki_app/api/banner_api.dart';

import 'banner_service.dart';

class Repository {
  Future<Banners> callApi() async {
    return await BannerService.browse();
  }
}
