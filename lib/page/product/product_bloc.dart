import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tiki_app/api/product_api.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/page/product/product_repo.dart';

class ProductBloc extends BlocBase {
  final StreamController<List<ProductData>> _productCounter =
      StreamController<List<ProductData>>();

  Stream<List<ProductData>> get productStream => _productCounter.stream;

  Future callApi() async {
    new Repository().callApi().then((value) {
      print('API ${value.data.length}');
      _productCounter.sink.add(value.data);
    }).catchError((error) {
      print('API error $error');
      _productCounter.addError(error);
    });
  }

  @override
  void dispose() {
    _productCounter.close();
  }
}
