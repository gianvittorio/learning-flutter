import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("The Title"),
              backgroundColor: Colors.lightBlue,
              centerTitle: true,
              actions: <Widget>[Icon(Icons.mic), Icon(Icons.mic_none)],
              brightness: Brightness.dark,
              leading: Icon(Icons.speaker),
            ),
            backgroundColor: Colors.white,
            body: Text("Hello"),
            drawer: Drawer(child: Text("I am the drawer")),
            floatingActionButton: FloatingActionButton(
                onPressed: () {}, child: Icon(Icons.add))));
  }
}
