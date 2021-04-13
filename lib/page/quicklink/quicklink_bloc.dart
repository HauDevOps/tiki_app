import 'dart:async';

import 'package:tiki_app/api/quicklink_api.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/page/quicklink/quicklink_repo.dart';

class QuickLinkBloc extends BlocBase {
  final StreamController<List<QuickLinkData>> _quicklinkCounter =
  StreamController<List<QuickLinkData>>();

  Stream<List<QuickLinkData>> get quicklinkStream => _quicklinkCounter.stream;

  Future callApi() async {
    new Repository().callApi().then((value) {
      print('API ${value.data.length}');
      _quicklinkCounter.sink.add(value.data);
    }).catchError((error) {
      print('API error $error');
      _quicklinkCounter.addError(error);
    });
  }

  @override
  void dispose() {
    _quicklinkCounter.close();
  }
}
