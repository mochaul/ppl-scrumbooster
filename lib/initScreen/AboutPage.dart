import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Scrum Booster", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}