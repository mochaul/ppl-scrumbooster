import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ApiProvider.dart';
import 'package:ScrumBooster/contentsList/ListProblems/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

class ListProblems extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

  var utils = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: utils.defaultDrawer(context),
      key: scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: utils.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          "Scrum Booster".toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: utils.hexToColor("#FFFFFF"),
          ),
        ),
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: new InkWell(
              child: new Icon(
                Icons.search,
                color: utils.hexToColor("#FFFFFF"),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              "PROBLEMS",
              style: TextStyle(
                fontSize: utils.fitScreenSize(_height, 0.04),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            new Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Image.asset(
              "assets/listProblems/problems.png",
              height: utils.fitScreenSize(_height, 0.3),
              width: utils.fitScreenSize(_width, 0.3),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(
                    "A",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "B",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "C",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Code quality is poor",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Customers Are Frustated With Progress",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Customers Are Not Satisfied With The End Product",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Customers Won't Commit To Project",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "D",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "E",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "F",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Failure to Foresee Potential Problems",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "G",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "H",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "I",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "J",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "K",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "L",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Lack Of Internal And External Support For Project",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "M",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "N",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "O",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Organizational Performance Isn't Improving",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "P",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Poor Project Communication",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Projects Do Not Get Delivered On Schedule",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Project Estimates Are Unrealistice or Unknown",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Project Information Isn't Available When Needed",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Project Team Member Training Is Inadequate For The Task",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Project Team Responsibilities Are Not Clear",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "Q",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "R",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Requirements Are Always Changing",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "Requirements Are Vague or Open-ended",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "S",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "T",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   new InkWell(
                    child: Text(
                      "There Are Too Many Bugs During A Project Or Post-Project",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "U",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   new InkWell(
                    child: Text(
                      "Unable To Secure or Retain Project Resources",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                   new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "V",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ), Text(
                    "W",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "X",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "Y",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "Z",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
