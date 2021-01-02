import 'package:flutter/material.dart';

// main function is the starting point for all flutter apps.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I Am Rich"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.jpeg'),
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
    ),
  );
}
