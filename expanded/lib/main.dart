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
            body: Row(children: <Widget>[
      Expanded(
          flex: 1,
          child: Card(child: Center(child: Text("Hey I am number one")))),
      Expanded(
          flex: 2,
          child: Card(child: Center(child: Text("Hey I am number one")))),
      Expanded(
          flex: 1,
          child: Card(child: Center(child: Text("Hey I am number one"))))
    ])));
  }
}
