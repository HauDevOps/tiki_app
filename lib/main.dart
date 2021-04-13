import 'package:flutter/material.dart';
import 'package:tiki_app/page/routers/customer_router.dart';
import 'package:tiki_app/page/routers/router_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomerRouter.allRoutes,
      initialRoute: router_api,
    );
  }
}