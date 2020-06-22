import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'option.dart';

class ProblemSolvingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Problem Solving',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0),child: Text("TYPE")),
            OptionWidgets(),
          ],
        ),
      )
    );
  }
}
