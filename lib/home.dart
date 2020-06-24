import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clock/clock_painter.dart';
import 'package:flutter_clock/white_clock.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Color(0xff051A23);
const dullBg = Color(0xffE3EDF7);

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

@override
class _HomeState extends State<Home> {
  String _timeString;

  @override
  void initState() {
    super.initState();
    _timeString = _formateDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  _getTime() {
    final now = DateTime.now();
    final time = _formateDateTime(now);
    setState(
      () {
        _timeString = time;
        print("Time: " + _timeString);
      },
    );
  }

  _formateDateTime(DateTime time) {
    return DateFormat('hh:mm').format(time);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: dullBg,
        title: Text(
          "Neumorphic Clock",
          style: GoogleFonts.sourceSansPro(
              color: Colors.blue[300],
              fontSize: 36.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: dullBg, //0xff051A23),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.rotate(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: CustomPaint(
                          painter: ClockPainter(),
                        ),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width / 1.3,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(4, 4),
                                blurRadius: 8.0,
                                spreadRadius: 2),
                            BoxShadow(
                                color: Colors.white12,
                                offset: Offset(-4, -4),
                                blurRadius: 8.0,
                                spreadRadius: 2),
                          ],
                          // color: Colors.transparent,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width / 0.75),
                        ),
                      ),
                      WhiteClock(),
                    ],
                  ),
                  angle: pi / 2,
                ),
                // WhiteClock(),
                SizedBox(height: 60),
                timeContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  timeContainer() => Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD6E3F3)),
          color: Color(0xffE3EDF7),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [const Color(0xFF50CAFF), const Color(0xFF0478FF)],
          ),
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _timeString.toString(),
          style: GoogleFonts.sourceSansPro(
              color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
        ),
      );
} //0xffFf8fbf8

class Clock extends StatelessWidget {
  const Clock({Key key}) : super(key: key);
  final double x = 4;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    return Container(
      child: CustomPaint(
        painter: ClockPainter(),
      ),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 1.3,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.white10,
              offset: Offset(-x, -x),
              blurRadius: 0.0,
              spreadRadius: 2),
          BoxShadow(
              color: backgroundColor,
              offset: Offset(-x, -x),
              blurRadius: 2,
              spreadRadius: -6),
        ],
        color: Colors.transparent,
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 0.75),
      ),
    );
  }
}
