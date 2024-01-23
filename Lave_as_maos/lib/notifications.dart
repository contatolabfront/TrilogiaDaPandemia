import 'remainder.dart';

int iteracoes = 0;
List<DateTime> intervalos = [];

void notifications(Duration frequency, DateTime startTime, DateTime endTime) {
  Duration timeInterval = frequency;
  DateTime startTimeNT = startTime;
  DateTime endTimeNT = endTime;
  DateTime zeroHour = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day + 1, 00, 00);
  DateTime zeroHourf = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 00, 00);
  DateTime nextTime = startTimeNT;

  int difference = 0;
  if (timeInterval == Duration(minutes: 15)) {
    difference = (endTimeNT.difference(startTimeNT).inMinutes) ~/ 15;
  } else if (timeInterval == Duration(minutes: 30)) {
    difference = (endTimeNT.difference(startTimeNT).inMinutes) ~/ 30;
  } else if (timeInterval > Duration(minutes: 30)) {
    difference = endTimeNT.difference(startTimeNT).inHours;
  }

  int compare = endTimeNT.compareTo(startTimeNT);
  //comparando datas
  if (compare == 1) {
    //start é antes do q end

    print('start é antes do q end');
    iteracoes = 0;
    intervalos = [];
    for (int i = 0; i <= difference; i++) {
      if (!nextTime.isAfter(endTimeNT)) {
        print(nextTime);
        intervalos.add(nextTime);
        nextTime = nextTime.add(timeInterval);
        iteracoes++;
      }
    }
    print('numero de iteracoes: $iteracoes');
    print(intervalos);
  } else if (compare == -1) {
    //end é antes do q start

    print('end é antes do q start, diferenca de: $difference');

    int difference1 = (zeroHour.difference(startTimeNT).inMinutes) ~/ 15;
    int difference2 = (endTimeNT.difference(zeroHourf).inMinutes) ~/ 15;
    difference = difference1 + difference2;
    print('compare 1 $difference1');
    print('compare 2 $difference2');
    print('compare total $compare');
    iteracoes = 0;
    intervalos = [];
    for (int i = 0; i <= difference; i++) {
      if (!nextTime.isAfter(endTimeNT.add(Duration(days: 1)))) {
        print(nextTime);
        intervalos.add(nextTime);
        nextTime = nextTime.add(timeInterval);
        iteracoes++;
      }
    }
    print('numero de iteracoes: $iteracoes');
  } else {
    // horarios sao iguais

    print('horarios sao iguais: nao faz nada');
  }
}
