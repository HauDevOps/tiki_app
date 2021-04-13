import 'package:rxdart/rxdart.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/entity/banner_entity.dart';
import 'package:tiki_app/entity/quick_link_entity.dart';
import 'package:tiki_app/remote/repository/repo.dart';

class HomeBloc extends BaseBloc{

  final _quickLinkController = BehaviorSubject<QuickLink>();
  final _bannerController = BehaviorSubject<List<BannerData>>();

  Stream<QuickLink> get quickLinkStream => _quickLinkController.stream;
  Stream<List<BannerData>> get bannerStream => _bannerController.stream;

  @override
  void dispose() {
    _quickLinkController.close();
    _bannerController.close();
  }

  Future getQuickLink() async {
    new Repository().getQuickLink().then((value) {
      _quickLinkController.sink.add(value);
    }).catchError((error) {
      _quickLinkController.addError(error);
    });
  }

  Future getBanner() async {
    new Repository().getBanner().then((value) {
      _bannerController.sink.add(value.data);
    }).catchError((error) {
      _bannerController.addError(error);
    });
  }

}