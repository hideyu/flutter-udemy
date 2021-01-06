import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MagicBall());

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int magicBallNumber = 1;

  void changeBallNumber() {
    // print("hogehoge");
    setState(
      () {
        magicBallNumber = Random().nextInt(5) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Magic 8 ball"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  changeBallNumber();
                },
                child: Image.asset('images/ball$magicBallNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
