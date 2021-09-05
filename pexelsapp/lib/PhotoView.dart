import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPage extends StatefulWidget {
  final String url;

  PhotoPage(this.url);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Hero(
            tag: widget.url,
            child: PhotoView(
                // minScale: MediaQuery.of(context).size.height * .5,
                // maxScale: MediaQuery.of(context).size.height * 2,
                imageProvider: NetworkImage(widget.url))));
  }
}
