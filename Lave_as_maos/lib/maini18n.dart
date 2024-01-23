import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "Keeping hands clean",
        "pt_br": "Mantenha as mãos limpas",
      } +
      {
        "en_us": "How to wash your hands",
        "pt_br": "Como lavar as mãos",
      } +
      {
        "en_us": "Set your reminder",
        "pt_br": "Criar lembretes",
      };

  String get i18n => localize(this, _t);
}
