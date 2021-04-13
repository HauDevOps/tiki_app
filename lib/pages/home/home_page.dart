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
      body: CustomScrollView(
        slivers: [
          _appBarWidget(),
          // SliverFixedExtentList(
          //   itemExtent: 230,
          //   delegate: SliverChildListDelegate([_bannerWidget(bloc)]),
          // ),
          _dealHotWidget(bloc),
          // _quickLinkWidget(bloc)
        ],
      ),
    );
  }

  Widget _appBarWidget() {
    return SliverAppBar(
      floating: false,
      expandedHeight: 50,
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
    return StreamBuilder(
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
            return Card(
              child: ListTile(
                onTap: () {},
                leading: Image.network(snapShot.data.data[index][0].imageUrl),
              ),
            );
          },
        );
      },
    );
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
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Image.network(
                    i.imageUrl,
                    fit: BoxFit.fill,
                    width: 420,
                    height: MediaQuery.of(context).size.width,
                  )),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget _dealHotWidget(HomeBloc bloc) {
    return StreamBuilder(
      stream: bloc.dealHotStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<Data>> snapShot) {
        if (!snapShot.hasData) {
          return Center(
            child: Text('Data not found'),
          );
        }
        return Container(
          color: Colors.grey,
          height: 260,
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              itemCount: snapShot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(15.0),
                              child: Image.network(
                                snapShot.data[index].product
                                    .thumbnailUrl,
                                height: 150.0,
                                width: 150.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Text(
                            snapShot.data[index].product.price
                                .toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
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
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
