import 'package:flutter/material.dart';
import 'package:pexelsapp/DartObject.dart';
import 'package:pexelsapp/PhotoView.dart';

class WallpapersPage extends StatefulWidget {
  final DartObject object;
  final Function(String, int) fetchData;

  WallpapersPage(this.object, this.fetchData);

  @override
  _WallpapersPageState createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: RefreshIndicator(
            onRefresh: () {
              return widget.fetchData("wallpaper", 20);
            },
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Column(children: <Widget>[
                            Hero(
                                tag: widget.object.photos[index].src.original,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PhotoPage(
                                                  widget.object.photos[index]
                                                      .src.original)));
                                    },
                                    child: Image.network(widget
                                        .object.photos[index].src.landscape))),
                            Container(
                                width: double.infinity,
                                child: Material(
                                    color: Theme.of(context).primaryColor,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            widget.object.photos[index]
                                                .photographer,
                                            textAlign: TextAlign.center))))
                          ])));
                },
                itemCount: widget.object.photos.length)));
  }
}
