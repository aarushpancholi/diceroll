import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF23293C),
        scaffoldBackgroundColor: Color(0xFF23293C),
        fontFamily: 'Ubuntu',
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'DiceRoll',
            style: TextStyle(
              color: Color(0xFF16EFFA),
            ),
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceScore = 1;
  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          diceScore = Random().nextInt(6) + 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  diceScore = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset("images/dice$diceScore.png"),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                'Shake your phone or tap your screen to roll the dice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xA616EFFA),
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
