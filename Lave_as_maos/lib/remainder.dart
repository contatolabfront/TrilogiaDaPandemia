import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'timerBrain.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'reminderi18n.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRoute createState() => _SecondRoute();
}

class _SecondRoute extends State<SecondRoute> {
  var startNotificationTime;
  var endNotificationTime;
  var frequencyItem;
  var activeState;
  bool _active;

  @override
  void initState() {
    super.initState();
    initializing();
    checkForScheduleNotifications();
    _loadCounter();
  }

  //Loading counter value on start
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      startNotificationTime = (prefs.getInt('startTime') ?? 108);
      endNotificationTime = (prefs.getInt('endTime') ?? 264);
      frequencyItem = (prefs.getInt('frequency') ?? 1);
      //activeState = (prefs.getBool('active') ?? false);
    });
    print("notificacaoes load counter: $_active");
    print("notificacaoes load counter: $frequencyItem");
  }

  //saving data
  _saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // set value
    setState(() {
      prefs.setInt('startTime', startNotificationTime);
      prefs.setInt('endTime', endNotificationTime);
      prefs.setInt('frequency', frequencyItem);
      //prefs.setBool('active', activeState);
    });
  }

  //delete counter after click
  _deleteCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('startTime');
    prefs.remove('endTime');
    prefs.remove('frequency');
    //prefs.remove('active');
    setState(() {
      startNotificationTime = 108;
      endNotificationTime = 264;
      frequencyItem = 1;
      //activeState = false;
    });
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelecNotification);
  }

  Future<void> checkForScheduleNotifications() async {
    var pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    if (pendingNotificationRequests.length > 0) {
      print('tem notificacao');
      setState(() {
        _absorb = true;
        _visible = true;
        buttonText = 'Stop Reminders'.i18n;
        buttonColor = Colors.red;
        _active = true;
        print('checkschedule:$_active');
      });
    } else {
      setState(() {
        _active = false;
        print('checkschedule:$_active');
      });
    }
  }

  Future<void> _checkPendingNotificationRequests() async {
    var pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              '${pendingNotificationRequests.length} pending notification requests'),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dailyNotifications(int num, List<DateTime> lista) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'Channel ID', 'Channel title', 'channel body',
            priority: Priority.High,
            importance: Importance.Max,
            ticker: 'test');

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidNotificationDetails, iOSPlatformChannelSpecifics);
    for (var i = 0; i <= num; i++) {
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          i,
          'Time to clean your hands.'.i18n,
          "Don't forget to wash or sanitize your hands. Keep them clean!💦"
              .i18n,
          Time(lista[i].hour, lista[i].minute, 0),
          platformChannelSpecifics);
    }
  }

  Future onSelecNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
      //we can set navigator to navigate other screens
    }
  }

  void createNotifications() {
    notifications(timeInterval, selectedStartTime, selectedEndTime);
    dailyNotifications(iteracoes - 1, intervalos);
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }

  Future<void> turnOffNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.cancelAll();
    _deleteCounter();
  }

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

//  List<DateTime> datas = [
//    DateTime(2020, 06, 28, 17, 51, 0, 0, 0),
//    DateTime(2020, 06, 28, 17, 52, 0, 0, 0),
//    DateTime(2020, 06, 28, 17, 53, 0, 0, 0),
//    DateTime(2020, 06, 28, 17, 54, 0, 0, 0),
//  ];

  DateTime selectedStartTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 09, 00);
  DateTime selectedEndTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 00);
  Duration timeInterval = Duration(minutes: 15);

  String buttonText = 'Start Reminders'.i18n;
  Color startColor = Colors.green;
  Color endColor = Colors.red;
  Color buttonColor = Colors.green;

  final baseColor = Color.fromRGBO(255, 255, 255, 0.3);

  void _updateLabels(int init, int end, int laps) {
    setState(() {
      startNotificationTime = init;
      endNotificationTime = end;

      selectedStartTime = _setTimers2(init);
      selectedEndTime = _setTimers2(end);

      _saveCounter();
    });
  }

  Widget _formatTextTimers(int time) {
    return Text(
      '${_formatTime(time)}',
      style: kTimeText,
    );
  }

  String _formatTime(int time) {
    if (time == 0 || time == null) {
      return '00:00';
    }
    var hours = time ~/ 12;
    var minutes = (time % 12) * 5;

    String sHours = hours.toString();
    String sMin = minutes.toString();

    sHours.length == 1 ? sHours = '0$sHours' : sHours = hours.toString();
    sMin.length == 1 ? sMin = '0$sMin' : sMin = minutes.toString();

    return '$sHours:$sMin';
  }

  DateTime _setTimers2(int time) {
    int hours = time ~/ 12;
    int minutes = (time % 12) * 5;

    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hours, minutes);
  }

  bool _visible = false;
  bool _absorb = false;
  int selectedValues;
  String selectedText;

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff999999),
                        width: 0.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CupertinoButton(
                        child: Text('Cancel'.i18n),
                        onPressed: () => Navigator.pop(context, false),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 5.0,
                        ),
                      ),
                      CupertinoButton(
                        child: Text('Confirm'.i18n),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 5.0,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                      backgroundColor: Colors.transparent,
                      itemExtent: 32.0,
                      looping: true,
                      useMagnifier: true,
                      scrollController: FixedExtentScrollController(
                          initialItem: frequencyItem),
                      onSelectedItemChanged: (selectedIndex) {
                        print(selectedIndex);
                        setState(() {
                          timeInterval = getFrequency(selectedIndex);
                          frequencyItem = selectedIndex;
                          _saveCounter();
                        });
                      },
                      children: [
                        Text(
                          'Every 15 min'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 30 min'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 1 hour'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 2 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 3 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 4 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 5 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 6 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 7 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 8 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 9 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 10 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 11 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                        Text(
                          'Every 12 hours'.i18n,
                          style: kfrequencyTextButton,
                        ),
                      ]),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepOrangeAccent, Colors.lightGreenAccent]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Container(
                  child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20, left: 20.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Lave as Mãos',
                          style: kLogoText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    AbsorbPointer(
                      absorbing: _absorb,
                      child: AnimatedOpacity(
                        opacity: _visible ? 0.1 : 1.0,
                        duration: Duration(milliseconds: 500),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'How often would you like to be reminded to clean your hands?'
                                    .i18n,
                                style: TextStyle(
                                    fontFamily: 'Source',
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DoubleCircularSlider(
                              288,
                              startNotificationTime,
                              endNotificationTime,
                              height: 360.0,
                              width: 360.0,
                              //primarySectors: 24,
                              secondarySectors: 24,
                              baseColor: Color.fromRGBO(255, 255, 255, 0.1),
                              selectionColor: baseColor,
                              handlerColor: Colors.white,
                              handlerOutterRadius: 20.0,
                              onSelectionChange: _updateLabels,
                              onSelectionEnd: _updateLabels,
                              sliderStrokeWidth: 24.0,
                              child: Padding(
                                  padding: const EdgeInsets.all(42.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'FREQUENCY:'.i18n,
                                        style: kSubText,
                                      ),
                                      SizedBox(height: 5),
                                      RaisedButton(
                                        onPressed: showPicker,
                                        color: Colors.white,
                                        child: Text(
                                          getFrequencyText(frequencyItem),
                                          style: kfrequencyTextButton,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                      ),
                                    ],
                                  )),
                              shouldCountLaps: true,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'START TIME:'.i18n,
                                          style: kSubText,
                                        ),
                                        _formatTextTimers(
                                            startNotificationTime),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'END TIME:'.i18n,
                                          style: kSubText,
                                        ),
                                        _formatTextTimers(endNotificationTime),
                                      ],
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Visibility(
                        visible: _visible,
                        child: Container(
                          width: 380,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.green,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.timer, size: 40),
                                  title:
                                      Text('Well done!'.i18n, style: kSubText),
                                  subtitle: Text(
                                    'Your reminders are active now.'.i18n,
                                    style: kSubText,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Notifications will be sent".i18n,
                                        style: kSubText,
                                      ),
                                      Text(
                                        getFrequencyText(frequencyItem)
                                            .toLowerCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontFamily: 'Source',
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'START TIME:'.i18n,
                                                    style: kSubText,
                                                  ),
                                                  _formatTextTimers(
                                                      startNotificationTime),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'END TIME:'.i18n,
                                                    style: kSubText,
                                                  ),
                                                  _formatTextTimers(
                                                      endNotificationTime),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Press the 'Stop Reminders' button to change or to cancel your reminders."
                                            .i18n,
                                        textAlign: TextAlign.center,
                                        style: kSubText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('estado: $_active');
                  if (_active == false) {
                    createNotifications();
                    setState(() {
                      _absorb = true;
                      _visible = true;
                      _active = true;
                      buttonColor = Colors.red;
                      buttonText = 'Stop Reminders'.i18n;
                    });
                  } else if (_active == true) {
                    turnOffNotification(flutterLocalNotificationsPlugin);
                    print('notification turn off');
                    setState(() {
                      _visible = false;
                      _absorb = false;
                      _active = false;
                      buttonColor = Colors.green;
                      buttonText = 'Start Reminders'.i18n;
                    });
                  }
                },
                child: Container(
                  child: Center(
                      child: Text(
                    buttonText,
                    style: TextStyle(
                        fontFamily: 'Source',
                        fontSize: 30.0,
                        color: Colors.white,
                        letterSpacing: 2.4,
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  margin:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  width: double.infinity,
                  height: 50.0,
                ),
              ),
//              GestureDetector(
//                onTap: () {
//                  turnOffNotification(flutterLocalNotificationsPlugin);
//                  print('notification turn off');
//                  setState(() {
//                    _visible = false;
//                    _absorb = false;
//                  });
//                },
//                child: Container(
//                  child: Center(
//                      child: Text(
//                    'stop notification',
//                    style: TextStyle(
//                        fontFamily: 'Source',
//                        fontSize: 30.0,
//                        color: Colors.white,
//                        letterSpacing: 2.4,
//                        fontWeight: FontWeight.bold),
//                  )),
//                  decoration: BoxDecoration(
//                    color: Colors.red,
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.black.withOpacity(0.3),
//                        spreadRadius: 2,
//                        blurRadius: 3,
//                        offset: Offset(0, 3), // changes position of shadow
//                      ),
//                    ],
//                    borderRadius: BorderRadius.circular(50.0),
//                  ),
//                  margin:
//                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
//                  width: double.infinity,
//                  height: 50.0,
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
