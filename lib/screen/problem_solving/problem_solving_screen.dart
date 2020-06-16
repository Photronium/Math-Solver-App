import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'option.dart';

class ProblemSolvingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem Solving',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: OptionWidgets(),
    );
  }
}
