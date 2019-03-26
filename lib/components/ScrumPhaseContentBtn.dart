import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
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
    return new Column(
      children: <Widget>[
        new ScrumListBtn(
          title: this.title,
          action: this.action,
          imgUrl: this.imageAssetURL,
        ),
        new Container(
          height: 10.5,
          width: 150.0,
          child: new Text(
            this.title,
            textAlign: TextAlign.center,
          )
        ),
      ],
    );
  }
}
