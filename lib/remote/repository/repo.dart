import 'package:tiki_app/entity/banner_entity.dart';
import 'package:tiki_app/entity/deal_hot_entity.dart';
import 'package:tiki_app/entity/quick_link_entity.dart';
import 'package:tiki_app/remote/api/tiki_api.dart';

class Repository {

  // Get Banner
  Future<BannerEntity> getBanner() async {
    return await TikiApi().getBanner();
  }

  // Get Quick link
  Future<QuickLink> getQuickLink() async {
    return await TikiApi().getQuickLink();
  }

  Future<DealHotEntity> getDealHot() async {
    return await TikiApi().getDealHot();
  }
}