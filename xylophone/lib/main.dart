import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    // audioplayers paclages
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  playSound(1);
                },
                child: Text("Click me"),
              ),
              FlatButton(
                color: Colors.orange,
                onPressed: () {
                  playSound(2);
                },
                child: Text("Click me"),
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  // audioplayers
                  playSound(3);
                },
                child: Text("Click me"),
              ),
              FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  // audioplayers
                  playSound(4);
                },
                child: Text("Click me"),
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  // audioplayers
                  playSound(5);
                },
                child: Text("Click me"),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  // audioplayers
                  playSound(6);
                },
                child: Text("Click me"),
              ),
              FlatButton(
                color: Colors.purple,
                onPressed: () {
                  // audioplayers
                  playSound(7);
                },
                child: Text("Click me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
