import 'dart:async';

import 'package:tiki_app/api/banner_api.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';

import 'banner_repo.dart';

class BannerBloc extends BlocBase {
  final StreamController<List<BannerData>> _bannerCounter =
  StreamController<List<BannerData>>();

  Stream<List<BannerData>> get bannerStream => _bannerCounter.stream;

  Future callApi() async {
    new Repository().callApi().then((value) {
      print('API ${value.data.length}');
      _bannerCounter.sink.add(value.data);
    }).catchError((error) {
      print('API error $error');
      _bannerCounter.addError(error);
    });
  }

  @override
  void dispose() {
    _bannerCounter.close();
  }
}
