import 'package:flutter/cupertino.dart';
import 'constants.dart';
import 'reminderi18n.dart';

Duration getFrequency(int frequency) {
  switch (frequency) {
    case 0:
      {
        return Duration(minutes: 15);
      }
      break;
    case 1:
      {
        return Duration(minutes: 30);
      }
      break;
    case 2:
      {
        return Duration(hours: 1);
      }
      break;
    case 3:
      {
        return Duration(hours: 2);
      }
      break;
    case 4:
      {
        return Duration(hours: 3);
      }
      break;
    case 5:
      {
        return Duration(hours: 4);
      }
      break;
    case 6:
      {
        return Duration(hours: 5);
      }
      break;
    case 7:
      {
        return Duration(hours: 6);
      }
      break;
    case 8:
      {
        return Duration(hours: 7);
      }
      break;
    case 9:
      {
        return Duration(hours: 8);
      }
      break;
    case 10:
      {
        return Duration(hours: 9);
      }
      break;
    case 11:
      {
        return Duration(hours: 10);
      }
      break;
    case 12:
      {
        return Duration(hours: 11);
      }
      break;
    case 13:
      {
        return Duration(hours: 12);
      }
      break;
  }
}

String getFrequencyText(int frequency) {
  switch (frequency) {
    case 0:
      {
        return 'Every 15 min'.i18n;
      }
      break;
    case 1:
      {
        return 'Every 30 min'.i18n;
      }
      break;
    case 2:
      {
        return 'Every 1 hour'.i18n;
      }
      break;
    case 3:
      {
        return 'Every 2 hours'.i18n;
      }
      break;
    case 4:
      {
        return 'Every 3 hours'.i18n;
      }
      break;
    case 5:
      {
        return 'Every 4 hours'.i18n;
      }
      break;
    case 6:
      {
        return 'Every 5 hours'.i18n;
      }
      break;
    case 7:
      {
        return 'Every 6 hours'.i18n;
      }
      break;
    case 8:
      {
        return 'Every 7 hours'.i18n;
      }
      break;
    case 9:
      {
        return 'Every 8 hours'.i18n;
      }
      break;
    case 10:
      {
        return 'Every 9 hours'.i18n;
      }
      break;
    case 11:
      {
        return 'Every 10 hours'.i18n;
      }
      break;
    case 12:
      {
        return 'Every 11 hours'.i18n;
      }
      break;
    case 13:
      {
        return 'Every 12 hours'.i18n;
      }
      break;
  }
}
