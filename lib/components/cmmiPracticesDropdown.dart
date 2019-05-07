import 'package:flutter/material.dart';
import 'package:ScrumBooster/components/customExpandedTileHeader.dart' as customExpandedTile;
import 'package:ScrumBooster/Utils/utils.dart';

class CmmiPracticesDropdown extends StatelessWidget {
  final int id;
  final String title;
  final String strengthens;
  final String satisfy;
  final String demonstrated;

  CmmiPracticesDropdown({
    Key key,
    this.id,
    this.title,
    this.strengthens,
    this.satisfy,
    this.demonstrated,
  }) : super(key: key);

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Flexible(
      child: customExpandedTile.ExpansionTile(
        iconColor: util.hexToColor("#FFFFFF"),
        initiallyExpanded: true,
        headerBackgroundColor: util.hexToColor("#3498DB"),
        title: Container(
          child: Text(
            this.title,
            style: TextStyle(
              color: util.hexToColor("#FFFFFF"),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        children: <Widget>[
          new Container(
            height: util.fitScreenSize(_height, 0.5),
            width: _width,
            child: new Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "- Strengthen agile implementations by:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "${this.strengthens}\n",
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "- Could satisfy the practice if:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "${this.satisfy}\n",
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "- Could be demonstrated by:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "${this.demonstrated}",
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
