import 'package:flutter/material.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/main_test/main_page.dart';
import 'package:tiki_app/page/banner/banner_bloc.dart';
import 'package:tiki_app/page/banner/banner_page.dart';
import 'package:tiki_app/page/product/product_bloc.dart';
import 'package:tiki_app/page/product/product_page.dart';
import 'package:tiki_app/page/quicklink/quicklink_bloc.dart';
import 'package:tiki_app/page/quicklink/quicklink_page.dart';
import 'package:tiki_app/page/routers/router_name.dart';

class CustomerRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case router_api:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  child: QuickLinkPage(),
                  bloc: QuickLinkBloc(),
                ));
        return MaterialPageRoute(builder: (_) => null);
    }
  }
}
