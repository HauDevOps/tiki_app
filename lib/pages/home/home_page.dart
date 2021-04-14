import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/entity/banner_entity.dart';
import 'package:tiki_app/entity/deal_hot_entity.dart';
import 'package:tiki_app/entity/quick_link_entity.dart';
import 'package:tiki_app/pages/home/home_bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc.getQuickLink();
    bloc.getBanner();
    bloc.getDealHot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: CustomScrollView(
        slivers: [
          _appBarWidget(),
          SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildListDelegate([_bannerWidget(bloc)]),
          ),
          SliverFixedExtentList(
            itemExtent: 180,
            delegate: SliverChildListDelegate([_dealHotWidget(bloc)]),
          ), SliverFixedExtentList(
            itemExtent: 240,
            delegate: SliverChildListDelegate([_quickLinkWidget(bloc)]),
          ),
          // _quickLinkWidget(bloc)
        ],
      ),
    );
  }

  Widget _appBarWidget() {
    return SliverAppBar(
      floating: false,
      expandedHeight: 50,
      backgroundColor: Colors.blue[300],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'TIKI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _quickLinkWidget(HomeBloc bloc) {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: bloc.quickLinkStream,
        builder: (BuildContext context, AsyncSnapshot<QuickLink> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: Text('Data not found'),
            );
          }
          return ListView.builder(
            itemCount: snapShot.data.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 100,
                  width: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapShot.data.data[index].length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.all(7),
                          child: Column(
                                children: [
                                  Image.network(snapShot.data.data[index][i].imageUrl, height: 50, width: 50,),
                                  Text(snapShot.data.data[index][i].title, textAlign: TextAlign.center,),
                                ],
                          ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _bottomWidget(){
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.table_chart),
        label: 'Danh mục',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.fireplace),
        label: 'Lướt',
      ),
    ],);
  }

  Widget _bannerWidget(HomeBloc bloc) {
    return StreamBuilder(
      stream: bloc.bannerStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<BannerData>> snapShot) {
        if (!snapShot.hasData) {
          return Center(
            child: Text('Data not found'),
          );
        }
        return CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1)),
          items: snapShot.data.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Center(
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(15.0),
                      child: Image.network(
                        i.imageUrl,
                        fit: BoxFit.fill,
                        width: 300,
                        height: 140,
                      ),
                    ));
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget _dealHotWidget(HomeBloc bloc) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            titleDealHot(),
            StreamBuilder(
              stream: bloc.dealHotStream,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Data>> snapShot) {
                if (!snapShot.hasData) {
                  return Center(
                    child: Text('Data not found'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(5),
                    itemCount: snapShot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(15.0),
                              child: Image.network(
                                snapShot.data[index].product
                                    .thumbnailUrl,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              snapShot.data[index].product.price
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(5),
                              child: Text(
                                'Đã bán ' +
                                    snapShot.data[index].progress
                                        .qtyOrdered
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    backgroundColor:
                                    Colors.red[600]),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget titleDealHot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Giá Sốc / Hôm Nay',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.deepOrange),
        ),
        TweenAnimationBuilder<Duration>(
          duration: Duration(minutes: 60),
          tween: Tween(begin: Duration(minutes: 120), end: Duration.zero),
          onEnd: () {},
          builder: (BuildContext context, Duration value, Widget child) {
            final minutes = value.inMinutes % 60;
            final seconds = value.inSeconds % 60;
            final hour = value.inHours % 24;
            return Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Text(
                      "$hour",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          backgroundColor: Colors.red),
                    )),
                Text(" : "),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Text(
                      "$minutes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          backgroundColor: Colors.red),
                    )),
                Text(" : "),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Text(
                      "$seconds",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          backgroundColor: Colors.red),
                    )),
              ],
            );
          },
        ),
        // Text(
        //   '>',
        //   style: TextStyle(
        //       fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
        // ),
      ],
    );
  }
}
