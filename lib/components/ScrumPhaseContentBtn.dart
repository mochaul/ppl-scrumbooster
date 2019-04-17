import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/components/ScrumListBtn.dart';

class ScrumPhaseContentBtn extends StatelessWidget {
  final String title;
  final String imageAssetURL;
  final VoidCallback action;

  ScrumPhaseContentBtn({
    Key key,
    @required this.title,
    @required this.imageAssetURL,
    @required this.action,
  }) : super(key: key);

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return new Column(
      children: <Widget>[
        new ScrumListBtn(
          title: this.title,
          action: this.action,
          imgUrl: this.imageAssetURL,
        ),
        new Padding(
          padding: EdgeInsets.all(10.0),
        ),
        new Container(
          height: util.fitScreenSize(_height, 0.05),
          width: util.fitScreenSize(_width, 0.3),
          child: new Text(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
      ],
    );
  }
}
