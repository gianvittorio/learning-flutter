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
            body: Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                  color: Colors.transparent,
                  elevation: 5.0,
                  child: Text("Learn Flutter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold)),
                ))),
        FlutterLogo()
      ],
    )));
  }
}
