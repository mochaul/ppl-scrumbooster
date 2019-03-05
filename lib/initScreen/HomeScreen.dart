import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class HomePage extends StatelessWidget {
  final List<String> myList = new List();

  HomePage({Key key, List<String> myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    myList.add("Product Backlog");
    myList.add("Sprint Planning");
    myList.add("Sprint Execution");
    myList.add("Sprint Evaluation");

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Scrum Booster")),
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ceremonies'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Problems'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Glossary'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Pop Quiz!'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}