import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "Time to clean your hands.",
        "pt_br": "Hora de lavar as mãos.",
      } +
      {
        "en_us":
            "Don't forget to wash or sanitize your hands. Keep them clean!💦",
        "pt_br":
            "Não se esqueça de lavar ou higienizar as mãos. Mantenha as mãos limpas! 💦",
      } +
      {
        "en_us": "Stop Reminders",
        "pt_br": "Cancelar lembretes",
      } +
      {
        "en_us": "Start Reminders",
        "pt_br": "Iniciar lembretes",
      } +
      {
        "en_us": "Your reminders are active now.",
        "pt_br": "Seus lembretes estão ativos.",
      } +
      {
        "en_us": "Every 15 min",
        "pt_br": "A cada 15 min",
      } +
      {
        "en_us": "Every 30 min",
        "pt_br": "A cada 30 min",
      } +
      {
        "en_us": "Every 1 hour",
        "pt_br": "A cada 1 hora",
      } +
      {
        "en_us": "Every 2 hours",
        "pt_br": "A cada 2 horas",
      } +
      {
        "en_us": "Every 3 hours",
        "pt_br": "A cada 3 horas",
      } +
      {
        "en_us": "Every 4 hours",
        "pt_br": "A cada 4 horas",
      } +
      {
        "en_us": "Every 5 hours",
        "pt_br": "A cada 5 horas",
      } +
      {
        "en_us": "Every 6 hours",
        "pt_br": "A cada 6 horas",
      } +
      {
        "en_us": "Every 7 hours",
        "pt_br": "A cada 7 horas",
      } +
      {
        "en_us": "Every 8 hours",
        "pt_br": "A cada 8 horas",
      } +
      {
        "en_us": "Every 9 hours",
        "pt_br": "A cada 9 horas",
      } +
      {
        "en_us": "Every 10 hours",
        "pt_br": "A cada 10 horas",
      } +
      {
        "en_us": "Every 11 hours",
        "pt_br": "A cada 11 horas",
      } +
      {
        "en_us": "Every 12 hours",
        "pt_br": "A cada 12 horas",
      } +
      {
        "en_us": "How often would you like to be reminded to clean your hands?",
        "pt_br":
            "Com que frequência você gostaria de ser lembrado de limpar as mãos?",
      } +
      {
        "en_us": "FREQUENCY:",
        "pt_br": "FREQUÊNCIA:",
      } +
      {
        "en_us": "START TIME:",
        "pt_br": "INÍCIO:",
      } +
      {
        "en_us": "END TIME:",
        "pt_br": "TÉRMINO:",
      } +
      {
        "en_us": "Well done!",
        "pt_br": "Pronto!",
      } +
      {
        "en_us": "Your reminders are set up now.",
        "pt_br": "Os lembretes estão ativos.",
      } +
      {
        "en_us": "Notifications will be sent",
        "pt_br": "Você receberá notificações",
      } +
      {
        "en_us":
            "Press the 'Stop Reminders' button to change or to cancel your reminders.",
        "pt_br":
            "Aperte o botão 'Cancelar Lembretes' para alterar ou interromper os lembretes.",
      } +
      {
        "en_us": "Cancel",
        "pt_br": "Cancelar",
      } +
      {
        "en_us": "Confirm",
        "pt_br": "Confirmar",
      };

  String get i18n => localize(this, _t);
}
