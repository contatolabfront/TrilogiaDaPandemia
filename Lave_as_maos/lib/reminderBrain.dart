//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//class LocalNotifications extends StatefulWidget {
//  @override
//  _LocalNotificationsState createState() => _LocalNotificationsState();
//}
//
//class _LocalNotificationsState extends State<LocalNotifications> {
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//      FlutterLocalNotificationsPlugin();
//  AndroidInitializationSettings androidInitializationSettings;
//  IOSInitializationSettings iosInitializationSettings;
//  InitializationSettings initializationSettings;
//
//  @override
//  void initState() {
//    super.initState();
//    initializing();
//  }
//
//  void initializing() async {
//    androidInitializationSettings = AndroidInitializationSettings('app_icon');
//    iosInitializationSettings = IOSInitializationSettings(
//        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//    initializationSettings = InitializationSettings(
//        androidInitializationSettings, iosInitializationSettings);
//    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: onSelecNotification);
//  }
//
//  void _showNotifications() async {
//    await notification();
//  }
//
//  //clica e mostra a notificacao
//  Future<void> notification() async {
//    AndroidNotificationDetails androidNotificationDetails =
//        AndroidNotificationDetails(
//            'Channel ID', 'Channel title', 'channel body',
//            priority: Priority.High,
//            importance: Importance.Max,
//            ticker: 'test');
//
//    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
//    NotificationDetails notificationDetails =
//        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
//    await flutterLocalNotificationsPlugin.show(
//        0, 'Hello there', 'second line', notificationDetails);
//  }
//
//  //mostra notificao periodicamente, minute, hora, ...
////  Future<void> notification() async {
////    AndroidNotificationDetails androidNotificationDetails =
////        AndroidNotificationDetails('repeating channel id',
////            'repeating channel name', 'repeating description',
////            priority: Priority.High,
////            importance: Importance.Max,
////            ticker: 'test');
////
////    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
////    NotificationDetails notificationDetails =
////        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
////    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
////        'repeating body', RepeatInterval.EveryMinute, notificationDetails);
////  }
//
////  //mostra notificacao agendada
////  Future<void> scheduleNotification(int seconds, int minutes, int hours) async {
////    var scheduledNotificationDateTime = DateTime.now().add(Duration(
////      seconds: seconds,
////      minutes: minutes,
////      hours: hours,
////    ));
////    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
////        'your other channel id',
////        'your other channel name',
////        'your other channel description');
////    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
////    NotificationDetails platformChannelSpecifics = NotificationDetails(
////        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
////    await flutterLocalNotificationsPlugin.schedule(
////        0,
////        'scheduled title',
////        'scheduled body',
////        scheduledNotificationDateTime,
////        platformChannelSpecifics);
////  }
//
//  //mostra notificacao agendada
//  Future<void> scheduleNotification() async {
//    AndroidNotificationDetails androidNotificationDetails =
//        AndroidNotificationDetails(
//            'Channel ID', 'Channel title', 'channel body',
//            priority: Priority.High,
//            importance: Importance.Max,
//            ticker: 'test');
//
//    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//    NotificationDetails platformChannelSpecifics = NotificationDetails(
//        androidNotificationDetails, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.schedule(
//        0,
//        'scheduled title',
//        'scheduled body',
//        DateTime.now().add(Duration(seconds: 10)),
//        platformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.schedule(
//        2,
//        'scheduled title',
//        'scheduled body',
//        DateTime.now().add(Duration(seconds: 20)),
//        platformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.schedule(
//        3,
//        'scheduled title',
//        'scheduled body',
//        DateTime.now().add(Duration(seconds: 30)),
//        platformChannelSpecifics);
//  }
//
//  List<DateTime> datas = [
//    DateTime(2020, 06, 28, 16, 00, 0, 0, 0),
//    DateTime(2020, 06, 28, 16, 01, 0, 0, 0),
//    DateTime(2020, 06, 28, 16, 02, 0, 0, 0),
//    DateTime(2020, 06, 28, 16, 03, 0, 0, 0),
//  ];
//
//  Future<void> dailyNotifications(int num, List<DateTime> lista) async {
//    AndroidNotificationDetails androidNotificationDetails =
//        AndroidNotificationDetails(
//            'Channel ID', 'Channel title', 'channel body',
//            priority: Priority.High,
//            importance: Importance.Max,
//            ticker: 'test');
//
//    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//    NotificationDetails platformChannelSpecifics = NotificationDetails(
//        androidNotificationDetails, iOSPlatformChannelSpecifics);
//    for (var i = 0; i <= num; i++) {
//      await flutterLocalNotificationsPlugin.showDailyAtTime(
//          i,
//          'Time to clean your hands.',
//          'Daily notification shown at approximately ',
//          Time(lista[i].hour, lista[i].minute, 0),
//          platformChannelSpecifics);
//    }
//  }
//
//  Future onSelecNotification(String payLoad) {
//    if (payLoad != null) {
//      print(payLoad);
//
//      //we can set navigator to navigate other screens
//
//    }
//  }
//
//  int iteracoes = 0;
//  List<DateTime> intervalos = [];
//
//  void notifications(Duration frequency, DateTime startTime, DateTime endTime) {
//    Duration timeInterval = frequency;
//    DateTime startTimeNT = startTime;
//    DateTime endTimeNT = endTime;
//    DateTime zeroHour = DateTime(DateTime.now().year, DateTime.now().month,
//        DateTime.now().day + 1, 00, 00);
//    DateTime zeroHourf = DateTime(
//        DateTime.now().year, DateTime.now().month, DateTime.now().day, 00, 00);
//    DateTime nextTime = startTimeNT;
//
//    int difference = 0;
//    if (timeInterval == Duration(minutes: 15)) {
//      difference = (endTimeNT.difference(startTimeNT).inMinutes) ~/ 15;
//    } else if (timeInterval == Duration(minutes: 30)) {
//      difference = (endTimeNT.difference(startTimeNT).inMinutes) ~/ 30;
//    } else if (timeInterval > Duration(minutes: 30)) {
//      difference = endTimeNT.difference(startTimeNT).inHours;
//    }
//
//    int compare = endTimeNT.compareTo(startTimeNT);
//    //comparando datas
//    if (compare == 1) {
//      //start é antes do q end
//
//      print('start é antes do q end');
//      iteracoes = 0;
//      intervalos = [];
//      for (int i = 0; i <= difference; i++) {
//        if (!nextTime.isAfter(endTimeNT)) {
//          print(nextTime);
//          intervalos.add(nextTime);
//          nextTime = nextTime.add(timeInterval);
//          iteracoes++;
//        }
//      }
//      print('numero de iteracoes: $iteracoes');
//      print(intervalos);
//    } else if (compare == -1) {
//      //end é antes do q start
//
//      print('end é antes do q start, diferenca de: $difference');
//
//      int difference1 = (zeroHour.difference(startTimeNT).inMinutes) ~/ 15;
//      int difference2 = (endTimeNT.difference(zeroHourf).inMinutes) ~/ 15;
//      difference = difference1 + difference2;
//      print('compare 1 $difference1');
//      print('compare 2 $difference2');
//      print('compare total $compare');
//      iteracoes = 0;
//      intervalos = [];
//      for (int i = 0; i <= difference; i++) {
//        if (!nextTime.isAfter(endTimeNT.add(Duration(days: 1)))) {
//          print(nextTime);
//          intervalos.add(nextTime);
//          nextTime = nextTime.add(timeInterval);
//          iteracoes++;
//        }
//      }
//      print('numero de iteracoes: $iteracoes');
//    } else {
//      // horarios sao iguais
//
//      print('horarios sao iguais: nao faz nada');
//    }
//  }
//
//  Future onDidReceiveLocalNotification(
//      int id, String title, String body, String payload) async {
//    return CupertinoAlertDialog(
//      title: Text(title),
//      content: Text(body),
//      actions: <Widget>[
//        CupertinoDialogAction(
//            isDefaultAction: true,
//            onPressed: () {
//              print("");
//            },
//            child: Text("Okay")),
//      ],
//    );
//  }
//
//  Future<void> turnOffNotification(
//      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//    await flutterLocalNotificationsPlugin.cancelAll();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Container(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          FlatButton(
//            onPressed: _showNotifications,
//            child: Text('Show notification'),
//          ),
//          FlatButton(
//            onPressed: () {
//              turnOffNotification(flutterLocalNotificationsPlugin);
//            },
//            child: Text('Stop notifications'),
//          ),
//          FlatButton(
//            onPressed: () {
//              scheduleNotification();
//            },
//            child: Text('notificacoes em 30 segundos'),
//          ),
//          FlatButton(
//            onPressed: () {
//              createNotifications();
//            },
//            child: Text('calculate time'),
//          ),
//          FlatButton(
//            onPressed: () {
//              dailyNotifications(3, datas);
//            },
//            child: Text('daily time'),
//          ),
//          FlatButton(
//            onPressed: () {
//              Navigator.pop(context);
//            },
//            child: Text('voltar'),
//          ),
//        ],
//      ),
//    ));
//  }
//}
