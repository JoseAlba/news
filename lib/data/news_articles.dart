/// {@template newsArticle}
/// A data class that represents each article from the NY times.
/// {@endtemplate}
class NewsArticle {
  NewsArticle({
    required this.title,
    required this.abstract,
    required this.imageUrl,
  });

  final String title;
  final String abstract;
  final String imageUrl;

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      abstract: json['abstract'] ?? '',
      imageUrl: json['multimedia'].isNotEmpty
          ? json['multimedia'][0]['url']
          : 'https://theme.zdassets.com/theme_assets/968999/d8a347b41db1ddee634e2d67d08798c102ef09ac.jpg', // Assuming first multimedia item is the image
    );
  }
}
