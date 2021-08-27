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
            body: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("Item No " + index.toString()));
                })));
  }
}
