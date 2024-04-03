import 'package:flutter/material.dart';
import 'package:weather/internationalization/internationalization.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({
    required this.imageUrl,
    required this.headline,
    required this.body,
  });

  final String headline;
  final String body;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Internationalization internationalization =
        Internationalization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(internationalization.details),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl),
            SizedBox(height: 16.0),
            Text(
              headline,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              body,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
