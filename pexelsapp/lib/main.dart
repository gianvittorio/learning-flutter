import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pexelsapp/DartObject.dart';

import 'SearchPage.dart';
import 'WallpapersPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  Map<String, String> headers = {
    "Authorization": "563492ad6f91700001000001eca499ea1c184c818e0d9966f436b799"
  };

  DartObject object;
  int pageNo = 1;

  @override
  void initState() {
    super.initState();

    this.fetchData("wallpaper", 20);
    this.controller = TabController(length: 2, vsync: this);
  }

  incPage() {
    ++pageNo;
  }

  String url(String query, int pageNo, int perPage) {
    return "https://api.pexels.com/v1/search?query=${query.trim()}&per_page=$perPage&page=$pageNo";
  }

  Future<void> fetchData(final String query, final int perPage) async {
    var data = await http.get(Uri.parse(url(query, pageNo, perPage)),
        headers: headers);

    incPage();

    var decodedJson = jsonDecode(data.body);

    object = DartObject.fromJson(decodedJson);

    setState(() {});

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Pexels App"),
            bottom: TabBar(controller: controller, tabs: <Widget>[
              Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                    Icon(Icons.image),
                    Text("Wallpapers")
                  ])),
              Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[Icon(Icons.search), Text("Search")])),
            ])),
        body: (object == null)
            ? (Center(child: CircularProgressIndicator()))
            : (TabBarView(controller: controller, children: <Widget>[
                WallpapersPage(object, fetchData),
                SearchPage()
              ])));
  }
}
