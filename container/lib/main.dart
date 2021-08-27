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
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.teal, Colors.tealAccent])),
                alignment: AlignmentDirectional.center,
                child: Text("Hello"))));
  }
}
