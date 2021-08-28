import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool first = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(50.0),
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    first = !first;
                  });
                },
                child: Text("Animate"))),
        AnimatedCrossFade(
          crossFadeState: (first)
              ? (CrossFadeState.showFirst)
              : (CrossFadeState.showSecond),
          duration: Duration(milliseconds: 500),
          firstChild: FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          secondChild:
              FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0),
        )
      ],
    )));
  }
}
