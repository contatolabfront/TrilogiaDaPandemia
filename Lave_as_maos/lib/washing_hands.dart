import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'washing_handsi18n.dart';

class WashingHands extends StatefulWidget {
  @override
  _WashingHandsState createState() => _WashingHandsState();
}

class _WashingHandsState extends State<WashingHands>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 40),
    );
  }

  List<String> instructions = [
    'Pinus inalcançável em sua altivez.',
    'Muda a cada toque dado.',
    'Incontrolável como círculo perpétuo.',
    'Existência firme e logarítmica.',
    'Acúleo sedento e virtual.',
    'Explora o substrato da razão.',
    'Navega quintessência escatológica.',
    'Transforma espinhos em escuridão.',
    'Chegou o messias.',
    'Reluz a coroa de espinhos.',
    'Suas mãos estão limpas agora!',
  ];

  Widget washingCards(bool releaseCards) {
    if (releaseCards == true) {
      return CarouselSlider(
        options: CarouselOptions(
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayInterval: Duration(seconds: 3, milliseconds: 666),
            autoPlay: true,
            initialPage: 0,
            height: 180.0),
        items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: <Widget>[
                    WebsafeSvg.asset("images/hand_washing/$i.svg",
                        height: 120, width: 120, color: Colors.white),
                    Text(
                      instructions[i - 1],
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: kWashText,
                    )
                  ],
                ),
              );
            },
          );
        }).toList(),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            WebsafeSvg.asset("images/hand_washing/virus.svg",
                height: 120, width: 120, color: Colors.white),
            SizedBox(height: 10.0),
            Text(
              'Press Play to start.'.i18n,
              style: kWashText,
              maxLines: 2,
            ),
            SizedBox(height: 25),
          ],
        ),
      );
    }
  }

  bool isActive = false;
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
                          'Lavar as Mãos',
                          style: kLogoText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'How to wash your hands properly:'.i18n,
                                style: kPageTitle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.center,
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        child: CustomPaint(
                                            painter: CustomTimerPainter(
                                                animation: controller,
                                                backgroundColor: Colors.white,
                                                color: Colors.redAccent)),
                                      ),
                                      Align(
                                        alignment: FractionalOffset.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 300.0,
                                              child: washingCards(isActive),
                                            ),
                                            Text(
                                              timerString,
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (context, child) {
                                  return FloatingActionButton.extended(
                                      onPressed: () {
                                        if (controller.isAnimating) {
                                          controller.reset();
                                          setState(() {
                                            isActive = false;
                                          });
                                        } else {
                                          controller.reverse(from: 1.0);
                                          setState(() {
                                            isActive = true;
                                          });
                                          controller
                                              .addStatusListener((status) {
                                            if (status ==
                                                AnimationStatus.dismissed) {
                                              isActive = false;
                                            }
                                          });
                                        }
                                      },
                                      backgroundColor: Colors.green,
                                      icon: Icon(controller.isAnimating
                                          ? Icons.stop
                                          : Icons.play_arrow),
                                      label: Text(controller.isAnimating
                                          ? "Stop".i18n
                                          : "Play"));
                                }),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
