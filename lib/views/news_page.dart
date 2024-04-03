import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/data/news_articles.dart';
import 'package:weather/layout/adaptive.dart';
import 'package:weather/providers/news_provider.dart';
import 'package:weather/views/article_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<NewsArticle> articles = Provider.of<NewsProvider>(context).articles;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: adaptiveCrossAxisCount(context),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticlePage(
                    imageUrl: article.imageUrl,
                    headline: article.title,
                    body: article.abstract,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 2.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      article.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      article.abstract,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
