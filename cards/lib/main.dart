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
    return Scaffold(
        body: Center(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Text("Hello")))));
  }
}
