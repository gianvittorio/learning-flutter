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
                child: RaisedButton(
      child: Text("Press me"),
      onPressed: () {
        print("You pressed on the icon");
      },
      color: Colors.teal,
    ))));
  }
}
