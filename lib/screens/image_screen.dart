import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String url;
  const ImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image hero practice'),
      ),
      body: Center(
          child: Hero(
        tag: 'imageData',
        child: Image.network(url),
      )),
    );
  }
}
