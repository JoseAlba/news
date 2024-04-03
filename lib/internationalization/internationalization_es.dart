import 'internationalization.dart';

/// The translations for Spanish Castilian (`es`).
class InternationalizationEs extends Internationalization {
  InternationalizationEs([String locale = 'es']) : super(locale);

  @override
  String get newsApp => 'Aplicación de noticias';

  @override
  String get error => 'Error';

  @override
  String get newYorkCity => 'Nueva York';

  @override
  String get details => 'Detalles';

  @override
  String get failedToLoadArticles => 'No se pudieron cargar los artículos';
}
