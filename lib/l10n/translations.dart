
import 'package:get/get.dart';
import 'en_translation.dart';
import 'es_translations.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': english,
        'es': spanish,
      };
}
