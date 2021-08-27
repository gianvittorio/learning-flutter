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
  String str = "Hey, My name is Gianvi";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network("https://images.app.goo.gl/NFw8GqzNB4P73iJJA"),
        Chip(
            label: Text(str,
                style: TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.all(50.0),
            child: OutlineButton(
              child: Text("Press me"),
              onPressed: () {
                str = "You just pressed the button";
                setState(() {});
              },
            ))
      ],
    ))));
  }
}
