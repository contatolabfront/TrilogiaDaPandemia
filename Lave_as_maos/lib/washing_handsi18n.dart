import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "Wet hands with water",
        "pt_br": "Molhe as mãos com água",
      } +
      {
        "en_us": "Apply Soap",
        "pt_br": "Aplique sabonete",
      } +
      {
        "en_us": "Rub hands palms to palms",
        "pt_br": "Ensaboe as palmas das mãos",
      } +
      {
        "en_us": "Lather the back of your hands",
        "pt_br": "Esfregue o dorso das mãos",
      } +
      {
        "en_us": "Scrub between your fingers",
        "pt_br": "Esfregue entre os dedos",
      } +
      {
        "en_us": "Rub the backs of fingers",
        "pt_br": "Esfregue atrás dos dedos",
      } +
      {
        "en_us": "Clean thumbs",
        "pt_br": "Limpe os dedões",
      } +
      {
        "en_us": "Wash fingernails and fingertips",
        "pt_br": "Lave as unhas e pontas dos dedos",
      } +
      {
        "en_us": "Rinse hands",
        "pt_br": "Enxágue as mãos",
      } +
      {
        "en_us": "Dry with a single use towel",
        "pt_br": "Seque com uma toalha de uso único",
      } +
      {
        "en_us": "Your hands are clean now!",
        "pt_br": "Suas mãos estão limpas agora!",
      } +
      {
        "en_us": "Press Play to start.",
        "pt_br": "Aperte o Play para iniciar.",
      } +
      {
        "en_us": "How to wash your hands properly:",
        "pt_br": "Como lavar as mãos corretamente:",
      } +
      {
        "en_us": "Stop",
        "pt_br": "Parar",
      };

  String get i18n => localize(this, _t);
}
