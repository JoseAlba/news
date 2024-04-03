import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/core/key.dart';
import 'package:weather/data/news_articles.dart';
import 'package:weather/internationalization/internationalization.dart';

class NewsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late List<NewsArticle> _articles;
  late SharedPreferences _prefs;

  /// {@macro newsArticle}
  List<NewsArticle> get articles => _articles;
  set articles(List<NewsArticle> articles) {
    _articles = articles;
    notifyListeners();
  }

  String get _apiUrl {
    final apiKey = '7XYflSaveZepY7KUEQNOqB1qEcnWxhpn';
    return 'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=$apiKey';
  }

  void _jsonDecodeArticles(String body) {
    final Map<String, dynamic> jsonData = json.decode(body);
    final List<dynamic> results = jsonData['results'];
    _articles = results
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();
  }

  Future<List<NewsArticle>?> _fetchCacheArticles() async {
    _prefs = await SharedPreferences.getInstance();
    String cachedData = _prefs.getString(Constants.NewsCache) ?? '';
    final String cachedTimestamp =
        _prefs.getString(Constants.NewsCacheTimestamp) ?? '';
    if (cachedData.isNotEmpty && cachedTimestamp.isNotEmpty) {
      final DateTime cachedDateTime = DateTime.parse(cachedTimestamp);
      if (DateTime.now().difference(cachedDateTime).inHours < 1) {
        _jsonDecodeArticles(cachedData);
        return _articles;
      }
    }
    return null;
  }

  Future<List<NewsArticle>> fetchArticles() async {
    final cacheArticles = await _fetchCacheArticles();
    if (cacheArticles != null) {
      return cacheArticles;
    }

    final apiUrl = _apiUrl;
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      _jsonDecodeArticles(response.body);
      _prefs.setString(Constants.NewsCache, response.body);
      _prefs.setString(Constants.NewsCacheTimestamp, DateTime.now().toString());
      return _articles;
    } else {
      BuildContext context = navigatorKey.currentContext!;
      throw Exception(Internationalization.of(context).failedToLoadArticles);
    }
  }
}
