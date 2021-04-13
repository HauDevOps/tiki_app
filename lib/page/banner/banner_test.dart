import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:tiki_app/api/banner_api.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/page/banner/banner_bloc.dart';

class BannerPage extends StatefulWidget {
  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BannerPage> {
  BannerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<BannerBloc>(context);
    bloc.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: StreamBuilder(
              stream: bloc.bannerStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<BannerData>> snapShot) {
                if (!snapShot.hasData) {
                  return Center(
                    child: Text('Data not found'),
                  );
                }
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    itemCount: snapShot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Carousel(
                          images: [
                            Image.network(
                              snapShot.data[index].imageUrl,
                              height: 100,
                              width: 300,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
