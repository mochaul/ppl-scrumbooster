import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/contents/problems.dart';

class HomePage extends StatelessWidget {
  final List<String> myList = new List();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

//  HomePage({Key key, List<String> myList}) : super(key: key);
  final util = new Util();
  @override
  Widget build(BuildContext context) {
    myList.add("Product Backlog");
    myList.add("Sprint Planning");
    myList.add("Sprint Execution");
    myList.add("Sprint Evaluation");

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new Icon(
          Icons.menu,
          color: util.hexToColor("#FFFFFF"),
        ),
        centerTitle: true,
        title: Text(
          "Scrum Booster",
          style: TextStyle(
            color: util.hexToColor("#FFFFFF"),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: new InkWell(
              child: new Icon(
                Icons.search,
                color: util.hexToColor("#FFFFFF"),
              ),
              onTap: () => {},
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Center(
              child: Text(
                myList[index],
                style: Theme.of(context).textTheme.headline,
              )
          );
        }),
      ),
      drawer: util.defaultDrawer(context),
    );
  }
}