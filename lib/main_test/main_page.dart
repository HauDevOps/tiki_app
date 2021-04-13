import 'package:flutter/material.dart';
import 'package:tiki_app/page/routers/customer_router.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverAppbar'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Basic'),
            ),
          ),
          // SliverFixedExtentList(delegate: SliverChildListDelegate([
          //   Container(color: Colors.green,),
          //   Container(color: Colors.red,),
          //   Container(color: Colors.yellow,),
          // ]), itemExtent: 50),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.purple,
                child: Text('purple'),
              );
            }, childCount: 9),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.green,
                child: Text('grid Item'),
              );
            }, childCount: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 2),
          ),
        ],
      ),
    );
  }
}
