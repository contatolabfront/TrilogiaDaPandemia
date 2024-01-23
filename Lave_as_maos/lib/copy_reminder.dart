//import 'package:flutter/material.dart';
//import 'constants.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:time/time.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'components/resusable_card.dart';
//import 'package:date_format/date_format.dart';
//
//class SecondRoute extends StatefulWidget {
//  @override
//  _SecondRoute createState() => _SecondRoute();
//}
//
//class _SecondRoute extends State<SecondRoute> {
//  String chosenTime = 'Every 2 hours';
//  DateTime _dateTime = DateTime(09, 00, 00);
//  String startTimeText = '09:00';
//  String endTimeText = '22:00';
//  DateTime startTime = DateTime(2020, 6, 25, 09, 00);
//  DateTime endTime = DateTime(2020, 6, 25, 22, 00);
//  Duration timeInterval = Duration(hours: 2);
//  bool activeState = true;
//  Color startColor = Colors.green;
//  Color endColor = Colors.red;
//  String buttonText = 'Start Reminders';
//
//  List<String> schedule = [
//    'Every 15 Minutes',
//    'Every 30 Minutes',
//    'Every 1 hour',
//    'Every 2 hours',
//    'Every 3 hours',
//    'Every 4 hours',
//    'Every 5 hours',
//    'Every 6 hours',
//    'Every 7 hours',
//    'Every 8 hours',
//    'Every 9 hours',
//    'Every 10 hours',
//    'Every 11 hours',
//    'Every 12 hours',
//  ];
//
//  void createNotifications() {
//    int count = 0;
//    //Duration timeInterval = Duration(hours: 1);
//    //DateTime startTime = DateTime(2020, 6, 25, 09, 30);
//    //DateTime endTime = DateTime(2020, 6, 25, 18, 00);
//    DateTime nextTime = startTime;
//
//    int difference = endTime.difference(startTime).inHours;
//
//    //print(startTime.add(timeInterval));
//    //print(difference);
//    //print(startTime);
//    // print(endTime);
//
//    if (startTime.isBefore(endTime) && endTime.isAfter(startTime)) {
//      print('ok horarios validos');
//      print(endTime.difference(startTime).inHours);
//      for (int i = 0; i < difference; i++) {
//        if (!nextTime.isAfter(endTime)) {
//          print(nextTime);
//          nextTime = nextTime.add(timeInterval);
//        }
//      }
//    } else {
//      print(
//          'intervalo de horario nao existente. o horario inicial tem q ser anterior ao horario final ');
//      print(startTime.difference(endTime).inHours);
//    }
//
////    for (int i = 0; i < difference; i++) {
////      if (!nextTime.isAfter(endTime)) {
////        print(nextTime);
////        nextTime = nextTime.add(timeInterval);
////      }
////    }
//  }
//
//  void dateCalculate() {
//    //verificar se os lembretes estao ativados, caso sim:
//    //checar se a hora atual é >= start time && <= ao end time
//    //se sim: - adicionar a frequencia na hora atual
//    //- disparar uma notificacao
//
//    DateTime tempoAgora = DateTime.now();
//    DateTime novoTempo = tempoAgora + 5.minutes;
//    print(tempoAgora);
//    print(novoTempo);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Container(
//          alignment: Alignment.center,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//                begin: Alignment.topRight,
//                end: Alignment.bottomLeft,
//                colors: [Colors.orange, Colors.purple]),
//          ),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Container(
//                child: Container(
//                  margin: EdgeInsets.only(top: 40.0),
//                  child: Stack(
//                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      GestureDetector(
//                        onTap: () {
//                          Navigator.pop(context);
//                        },
//                        child: Container(
//                          margin: EdgeInsets.only(top: 20, left: 20.0),
//                          child: Icon(
//                            Icons.arrow_back,
//                            color: Colors.white,
//                            size: 30,
//                          ),
//                        ),
//                      ),
//                      Container(
//                        alignment: Alignment.center,
//                        child: Text(
//                          'Clean Hands',
//                          style: kLogoText,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              //Expanded(),
//              //Expanded(),
//              Expanded(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Container(
//                      child: Text(
//                        'SET YOUR REMINDER',
//                        style: kPageTitle,
//                      ),
//                    ),
//                    ReusableCard(
//                      colour: Colors.white,
//                      cardChild: Column(
//                        children: <Widget>[
//                          Container(
//                            child: Text(
//                              'How often would you like to be reminded to wash your hands?',
//                              style: kCardText,
//                              textAlign: TextAlign.center,
//                            ),
//                            padding: EdgeInsets.only(top: 20.0, bottom: 20),
//                          ),
//                          Container(
//                            decoration: BoxDecoration(
//                              color: Colors.white,
//                              boxShadow: [
//                                BoxShadow(
//                                  color: Colors.black.withOpacity(0.3),
//                                  spreadRadius: 2,
//                                  blurRadius: 5,
//                                  offset: Offset(
//                                      4, 4), // changes position of shadow
//                                ),
//                              ],
//                            ),
//                            child: OutlineButton(
//                              borderSide: BorderSide(
//                                  color: Colors.blue,
//                                  width: 2,
//                                  style: BorderStyle.solid),
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(5),
//                              ),
//                              child: Text(
//                                '$chosenTime',
//                                style: kButtonText,
//                              ),
//                              padding: EdgeInsets.all(8),
//                              onPressed: () {
//                                showModalBottomSheet(
//                                    context: context,
//                                    builder: (BuildContext builder) {
//                                      return Container(
//                                        height: MediaQuery.of(context)
//                                                .copyWith()
//                                                .size
//                                                .height /
//                                            3,
//                                        child: CupertinoPicker(
//                                            itemExtent: 32.0,
//                                            looping: true,
//                                            onSelectedItemChanged:
//                                                (selectedIndex) {
//                                              print(selectedIndex);
//                                              setState(() {
//                                                chosenTime =
//                                                    schedule[selectedIndex];
//                                              });
//                                            },
//                                            children: [
//                                              Text('Every 15 Minutes'),
//                                              Text('Every 30 Minutes'),
//                                              Text('Every 1 hour'),
//                                              Text('Every 2 hours'),
//                                              Text('Every 3 hours'),
//                                              Text('Every 4 hours'),
//                                              Text('Every 5 hours'),
//                                              Text('Every 6 hours'),
//                                              Text('Every 7 hours'),
//                                              Text('Every 8 hours'),
//                                              Text('Every 9 hours'),
//                                              Text('Every 10 hours'),
//                                              Text('Every 11 hours'),
//                                              Text('Every 12 hours'),
//                                            ]),
//                                      );
//                                    });
//                              },
//                            ),
//                          ),
//                          SizedBox(
//                            height: 10,
//                          )
//                        ],
//                      ),
//                    ),
//                    Container(
//                      child: Text(
//                        'Between what hours would you like reminders? ',
//                        style: TextStyle(
//                            fontFamily: 'Source',
//                            fontSize: 16.0,
//                            color: Colors.white,
//                            letterSpacing: 1.0,
//                            fontWeight: FontWeight.bold),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                    SizedBox(
//                      height: 15,
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.white,
//                                borderRadius: BorderRadius.circular(10.0),
//                                boxShadow: [
//                                  BoxShadow(
//                                    color: Colors.black.withOpacity(0.3),
//                                    spreadRadius: 2,
//                                    blurRadius: 3,
//                                    offset: Offset(
//                                        0, 3), // changes position of shadow
//                                  ),
//                                ],
//                                border:
//                                    Border.all(color: Colors.white, width: 2)),
//                            padding: EdgeInsets.all(10.0),
//                            margin: EdgeInsets.only(left: 20.0),
//                            child: Column(
//                              children: <Widget>[
//                                Text(
//                                  'Start Time:',
//                                  style: kNormalText,
//                                ),
//                                GestureDetector(
//                                  onTap: () {
//                                    showCupertinoModalPopup(
//                                        context: context,
//                                        builder: (BuildContext context) {
//                                          return Container(
//                                            child: SizedBox(
//                                              height: 250,
//                                              child: CupertinoDatePicker(
//                                                backgroundColor: Colors.white,
//                                                initialDateTime: _dateTime,
//                                                use24hFormat: true,
//                                                mode: CupertinoDatePickerMode
//                                                    .time,
//                                                onDateTimeChanged: (dateTime) {
//                                                  setState(() {
//                                                    _dateTime = dateTime;
//                                                    startTime = dateTime;
//                                                    startTimeText =
//                                                        formatDate(dateTime, [
//                                                      HH,
//                                                      ':',
//                                                      nn,
//                                                    ]);
//                                                  });
//                                                },
//                                              ),
//                                            ),
//                                          );
//                                        });
//                                  },
//                                  child: Container(
//                                    child: Text(
//                                      '$startTimeText',
//                                      style: kNormalText,
//                                    ),
//                                    decoration: BoxDecoration(
//                                        color: Colors.white,
//                                        borderRadius:
//                                            BorderRadius.circular(10.0),
//                                        boxShadow: [
//                                          BoxShadow(
//                                            color:
//                                                Colors.black.withOpacity(0.3),
//                                            spreadRadius: 2,
//                                            blurRadius: 3,
//                                            offset: Offset(0,
//                                                3), // changes position of shadow
//                                          ),
//                                        ],
//                                        border: Border.all(
//                                            color: Colors.green, width: 2)),
//                                    margin: EdgeInsets.all(10.0),
//                                    padding: EdgeInsets.all(5.0),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                        SizedBox(width: 15.0),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                              color: Colors.white,
//                              boxShadow: [
//                                BoxShadow(
//                                  color: Colors.black.withOpacity(0.3),
//                                  spreadRadius: 2,
//                                  blurRadius: 3,
//                                  offset: Offset(
//                                      0, 3), // changes position of shadow
//                                ),
//                              ],
//                              borderRadius: BorderRadius.circular(10.0),
//                              border: Border.all(color: Colors.white, width: 2),
//                            ),
//                            padding: EdgeInsets.all(10.0),
//                            margin: EdgeInsets.only(right: 20.0),
//                            child: Column(
//                              children: <Widget>[
//                                Text(
//                                  'End Time:',
//                                  style: kNormalText,
//                                ),
//                                GestureDetector(
//                                  onTap: () {
//                                    showCupertinoModalPopup(
//                                        context: context,
//                                        builder: (BuildContext context) {
//                                          return Container(
//                                            child: SizedBox(
//                                              height: 250,
//                                              child: CupertinoDatePicker(
//                                                backgroundColor: Colors.white,
//                                                initialDateTime: _dateTime,
//                                                use24hFormat: true,
//                                                mode: CupertinoDatePickerMode
//                                                    .time,
//                                                onDateTimeChanged: (dateTime) {
//                                                  setState(() {
//                                                    _dateTime = dateTime;
//                                                    endTime = dateTime;
//                                                    endTimeText =
//                                                        formatDate(dateTime, [
//                                                      HH,
//                                                      ':',
//                                                      nn,
//                                                    ]);
//                                                  });
//                                                },
//                                              ),
//                                            ),
//                                          );
//                                        });
//                                  },
//                                  child: Container(
//                                    child: Text(
//                                      '$endTimeText',
//                                      style: kNormalText,
//                                    ),
//                                    decoration: BoxDecoration(
//                                        color: Colors.white,
//                                        borderRadius:
//                                            BorderRadius.circular(10.0),
//                                        boxShadow: [
//                                          BoxShadow(
//                                            color:
//                                                Colors.black.withOpacity(0.3),
//                                            spreadRadius: 2,
//                                            blurRadius: 3,
//                                            offset: Offset(0,
//                                                3), // changes position of shadow
//                                          ),
//                                        ],
//                                        border: Border.all(
//                                            color: Colors.red, width: 2)),
//                                    margin: EdgeInsets.all(10.0),
//                                    padding: EdgeInsets.all(5.0),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    GestureDetector(
//                      onTap: () {
//                        createNotifications();
//                        setState(() {
//                          if (activeState == true) {
//                            activeState = false;
//                            buttonText = 'Stop Reminders';
//                          } else {
//                            activeState = true;
//                            buttonText = 'Start Reminders';
//                          }
//                        });
//                      },
//                      child: Container(
//                        child: Center(
//                            child: Text(
//                          buttonText,
//                          style: TextStyle(
//                              fontFamily: 'Source',
//                              fontSize: 30.0,
//                              color: Colors.white,
//                              letterSpacing: 2.4,
//                              fontWeight: FontWeight.bold),
//                        )),
//                        decoration: BoxDecoration(
//                          color: activeState == true ? startColor : endColor,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black.withOpacity(0.3),
//                              spreadRadius: 2,
//                              blurRadius: 3,
//                              offset:
//                                  Offset(0, 3), // changes position of shadow
//                            ),
//                          ],
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
//                        margin: EdgeInsets.all(20.0),
//                        width: double.infinity,
//                        height: 50.0,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
