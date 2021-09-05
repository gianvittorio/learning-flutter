import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DartObject.dart';
import 'PhotoView.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DartObject object;

  Map<String, String> headers = {
    "Authorization": "563492ad6f91700001000001eca499ea1c184c818e0d9966f436b799"
  };

  String url(String query, int pageNo, int perPage) {
    return "https://api.pexels.com/v1/search?query=${query.trim()}&per_page=$perPage&page=1";
  }

  Future<void> fetchData(final String query, final int perPage) async {
    var data =
        await http.get(Uri.parse(url(query, 10, perPage)), headers: headers);

    var decodedJson = jsonDecode(data.body);

    object = DartObject.fromJson(decodedJson);

    setState(() {});

    return null;
  }

  Widget list() {
    return (object == null)
        ? (Center(child: Text("No images yet")))
        : (ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Column(children: <Widget>[
                        Hero(
                            tag: object.photos[index].src.original,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhotoPage(object
                                              .photos[index].src.original)));
                                },
                                child: Image.network(
                                    object.photos[index].src.landscape))),
                        Container(
                            width: double.infinity,
                            child: Material(
                                color: Theme.of(context).primaryColor,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        object.photos[index].photographer,
                                        textAlign: TextAlign.center))))
                      ])));
            },
            itemCount: object.photos.length));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                onFieldSubmitted: (text) {
                  fetchData(text, 10);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search"))),
        list()
      ],
    ));
  }
}
