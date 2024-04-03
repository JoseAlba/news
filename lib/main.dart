import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/key.dart';
import 'package:weather/internationalization/internationalization.dart';
import 'package:weather/providers/news_provider.dart';
import 'package:weather/views/news_page.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      navigatorKey: navigatorKey,
      localizationsDelegates: Internationalization.localizationsDelegates,
      supportedLocales: Internationalization.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: ChangeNotifierProvider(
        create: (_) => NewsProvider(),
        child: RootPage(),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsProvider newsProvider =
        Provider.of<NewsProvider>(context, listen: false);
    Internationalization internationalization =
        Internationalization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(internationalization.newsApp),
      ),
      body: FutureBuilder(
        future: newsProvider.fetchArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('${internationalization.error} ${snapshot.error}'));
          } else {
            return NewsPage();
          }
        },
      ),
    );
  }
}
