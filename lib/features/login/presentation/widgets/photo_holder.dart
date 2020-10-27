import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String imageApi =
    'https://api.nasa.gov/planetary/apod?api_key=ppTcSsjXqcBbdV3rRB1flb1BWGerAW3lFkj7yKHn&date=2020-08-23';

class PhotoHolder extends StatelessWidget {
  var imageUrl;

  PhotoHolder({this.imageUrl});

  void getPictureFromApi() async {
    final response = await http.get(imageApi);
    final decodedResponse = jsonDecode(response.body);
    this.imageUrl = decodedResponse['url'];
    print(this.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Image.network(
        'https://apod.nasa.gov/apod/image/2008/helix_blancoHubble_1080.jpg',
        fit: BoxFit.cover,
        errorBuilder: (context, object, stackTrace) {
          return Center(
            child: Text('Something went wrong.'),
          );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}
