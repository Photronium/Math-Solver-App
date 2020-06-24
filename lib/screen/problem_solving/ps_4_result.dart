import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/problem_solving/simplex_solver.dart';

import '../drawer.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  SimplexSolver solution = new SimplexSolver();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem Solving',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Column(
          children: [
            Text("FIND MAXIMUM OF"),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(solution.printEquation(),
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
            SizedBox(height: 15.0),
            Text("UNDER CONSTRAINT"),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(solution.printCondition(),
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
            Text("THE RESULT IS", style: TextStyle(fontSize: 18.0)),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text("No Result",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

