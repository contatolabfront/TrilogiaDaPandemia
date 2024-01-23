import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsclean/constants.dart';
import 'washing_hands.dart';
import 'remainder.dart';
import 'constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'maini18n.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: InputPage(),
//    );
//  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', "US"),
          const Locale('pt', "BR"),
        ],
        home: I18n(
          child: InputPage(),
        ),
      );
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.deepOrangeAccent, Colors.lightGreenAccent]),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(
                                'Lave as mãos',
                                textAlign: TextAlign.left,
                              ),
                              content: Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Version: 1.0.0'),
                                    Text('labfront.tk'),
                                    Text('© 2020')
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 10, top: 10),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Lave as Mãos',
                        style: kLogoText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        child: Image(
                          image: AssetImage('images/logo_lab400.png'),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 330.0,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_alarm,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Set your reminder'.i18n,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: 'Source',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WashingHands()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 330.0,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.pan_tool,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'How to wash your hands'.i18n,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: 'Source',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
