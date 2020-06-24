import 'package:flutter/material.dart';
import 'package:flutter_clock/white_clock_painter.dart';

class WhiteClock extends StatefulWidget {
  WhiteClock({Key key}) : super(key: key);

  @override
  _WhiteClockState createState() => _WhiteClockState();
}

class _WhiteClockState extends State<WhiteClock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: innerContainer(
        child: CustomPaint(
          painter: WhiteClockPainter(),
        ),
      ),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 1.2,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD6E3F3)),
        color: Color(0xffE3EDF7),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(111, 140, 176, 0.41),
              blurRadius: 20,
              offset: Offset(4, 4)),
          BoxShadow(
              color: Colors.white, blurRadius: 20, offset: Offset(-6, -6)),
          BoxShadow(
              color: Color.fromRGBO(114, 142, 171, 0.1),
              blurRadius: 4,
              offset: Offset(2, 2))
        ],
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 0.75),
      ),
    );
  }

  Widget innerContainer({child}) => Container(
        child: child,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.width / 1.45,
        width: MediaQuery.of(context).size.width / 1.45,
        decoration: BoxDecoration(
          // border: Border.all(color: Color(0xffD6E3F3)),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Color(0xffC1D5EE),
              blurRadius: 0,
            ),
            BoxShadow(
              color: Color(0xffE3EDF7),
              blurRadius: 8,
              spreadRadius: -2,
            ),
          ],
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 0.75),
        ),
      );
}
