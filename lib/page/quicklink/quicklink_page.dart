import 'package:flutter/material.dart';
import 'package:tiki_app/api/quicklink_api.dart';
import 'package:tiki_app/bloc/basic_bloc.dart';
import 'package:tiki_app/page/quicklink/quicklink_bloc.dart';


class QuickLinkPage extends StatefulWidget {
  @override
  _QuickLinkPageState createState() => _QuickLinkPageState();
}

class _QuickLinkPageState extends State<QuickLinkPage> {

  QuickLinkBloc bloc

  ,

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<QuickLinkBloc>(context);
    bloc.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: <Widget>[
              Container(
                child: StreamBuilder(
                  stream: bloc.quicklinkStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<QuickLinkData>> snapShot) {
                    if (!snapShot.hasData) {
                      return Center(
                        child: Text('Data not found'),
                      );
                    }
                  },
                ),


              ),
            ]

        ));
  }
}
