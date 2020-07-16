import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'option.dart';

class ProblemSolvingPage extends StatelessWidget {
  final String title;
  ProblemSolvingPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0),child: Text("TYPE")),
            OptionWidgets(title: title),
          ],
        ),
    );
  }
}
