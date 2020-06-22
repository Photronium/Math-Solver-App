import 'package:flutter/material.dart';
import 'screen/problem_solving/ps_1_method.dart';

const backgroundMainColor = Color(0xFFF2F2F2);

void main() {
  runApp(NumberCrunching());
}

class NumberCrunching extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: backgroundMainColor,
        scaffoldBackgroundColor: backgroundMainColor,
        accentColor: Colors.green,
        fontFamily: 'Rubik',
      ),
      home: ProblemSolvingPage(),
    );
  }
}
