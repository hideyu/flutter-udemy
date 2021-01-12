import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21), // tabbarとかの色
        scaffoldBackgroundColor: Color(0xFF0A0E21), // bodyとかの色
      ),
      home: InputPage(),
    );
  }
}
