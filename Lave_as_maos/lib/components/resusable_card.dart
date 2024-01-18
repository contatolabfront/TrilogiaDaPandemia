import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colour,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white, width: 2)),
      margin: EdgeInsets.all(20.0),
      child: cardChild,
    );
  }
}

//Container resusable_card() {
//  return Container(
//    decoration: BoxDecoration(
//        color: Colors.white,
//        boxShadow: [
//          BoxShadow(
//            color: Colors.black.withOpacity(0.3),
//            spreadRadius: 2,
//            blurRadius: 3,
//            offset: Offset(0, 3), // changes position of shadow
//          ),
//        ],
//        borderRadius: BorderRadius.circular(10.0),
//        border: Border.all(color: Colors.white, width: 2)),
//    margin: EdgeInsets.all(20.0),
//    child: Column(
//      children: <Widget>[
//        Container(
//          child: Text(
//            'How often would you like to be reminded to wash your hands?',
//            style: TextStyle(
//                fontFamily: 'Source',
//                fontSize: 24.0,
//                color: Colors.purple,
//                letterSpacing: 1.0,
//                fontWeight: FontWeight.bold),
//            textAlign: TextAlign.center,
//          ),
//          padding: EdgeInsets.all(20),
//        ),
//        Container(
//          child: DropdownButton<String>(
//            dropdownColor: Colors.white,
//            iconSize: 50.0,
//            items: [
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 15 minutes',
//                  style: kNormalText,
//                ),
//                value: 'Every 15 minutes',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 30 minutes',
//                  style: kNormalText,
//                ),
//                value: 'Every 30 minutes',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Hourly',
//                  style: kNormalText,
//                ),
//                value: 'Hourly',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 2 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 2 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 3 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 3 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 4 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 4 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 5 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 5 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 6 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 6 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 7 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 7 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 8 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 8 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 9 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 9 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 10 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 10 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 11 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 11 hours',
//              ),
//              DropdownMenuItem<String>(
//                child: Text(
//                  'Every 12 hours',
//                  style: kNormalText,
//                ),
//                value: 'Every 12 hours',
//              ),
//            ],
//            onChanged: (String value) {
//              setState(() {
//                dropdownValue = value;
//              });
//            },
//            hint: Text('Select Item'),
//            value: dropdownValue,
//          ),
//          padding: EdgeInsets.all(5.0),
//          margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
//        ),
//      ],
//    ),
//  );
//}
