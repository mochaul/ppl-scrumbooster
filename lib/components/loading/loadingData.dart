import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class LoadingData extends StatelessWidget {
  final double height;

  LoadingData({
    Key key,
    this.height,
  }) : super(key: key);

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: this.height,
      color: util.hexToColor("#FFFFFF"),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "Loading data...",
              style: TextStyle(
                fontSize: util.fitScreenSize(_height, 0.02),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
