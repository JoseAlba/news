import 'internationalization.dart';

/// The translations for English (`en`).
class InternationalizationEn extends Internationalization {
  InternationalizationEn([String locale = 'en']) : super(locale);

  @override
  String get newsApp => 'News App';

  @override
  String get error => 'Error';

  @override
  String get newYorkCity => 'New York City';

  @override
  String get details => 'Details';

  @override
  String get failedToLoadArticles => 'Failed to load articles';
}
