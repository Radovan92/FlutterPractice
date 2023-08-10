import 'package:flutter/material.dart';

import 'image_screen.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  const DetailsScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageScreen(url: imageUrl),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'imageData',
                    child: Container(
                      height: 500,
                      child: FutureBuilder<void>(
                        // Use FutureBuilder to wait for the image to load
                        future: precacheImage(NetworkImage(imageUrl), context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show spinner while loading
                          } else if (snapshot.hasError) {
                            return Text('Error loading image');
                          } else {
                            return Image.network(
                                imageUrl); // Show image when loaded
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
