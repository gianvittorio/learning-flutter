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
            body: Center(
                child: Container(
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Text("Hello"),
                        FlatButton(onPressed: () {}, child: Text("Pressed Me")),
                        Text("Hello"),
                        FlatButton(onPressed: () {}, child: Text("Pressed Me"))
                      ],
                    )))));
  }
}
