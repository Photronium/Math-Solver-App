import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/problem_solving/result.dart';

import '../drawer.dart';
import 'bottom_button.dart';
import 'number_input_field.dart';
import 'simplex_solver.dart';

class InputConstraint extends StatefulWidget {
  @override
  _InputConstraintState createState() => _InputConstraintState();
}

class _InputConstraintState extends State<InputConstraint> {
  List<Widget> equationInput = [];
  List<Widget> constraintInput = [];

  void modifyInputVariable() {
    equationInput.clear();
    equationInput.add(Expanded(child: Center(child: Text("Y = "))));
    for (var i = 0; i < int.parse(variableController.text); i++) {
      String temp = "X${i+1}";
      if(i+1 != int.parse(variableController.text))
        temp += " + ";
      equationInput.add(Expanded(child: NumberInputField()));
      equationInput.add(Expanded(child: Center(child: Text(temp))));
    }
  }

  void modifyInputConstraint() {
    constraintInput.clear();
    for (var i = 0; i < int.parse(constraintController.text); i++) {
      List<Widget> constraint = [];
      for (var j = 0; j < int.parse(variableController.text); j++) {
        String temp = "X${j+1}";
        if(j+1 != int.parse(variableController.text))
          temp += " + ";
        constraint.add(Expanded(child: NumberInputField()));
        constraint.add(Expanded(child: Center(child: Text(temp))));
      }
      constraint.add(Expanded(child: Center(child: Text("<="))));
      constraint.add(Expanded(child: NumberInputField()));
      constraintInput.add(Row(children: constraint));
      constraintInput.add(SizedBox(height: 10.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    modifyInputVariable();
    modifyInputConstraint();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Problem Solving',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text('FIND MAXIMUM OF',
                style: TextStyle(color: Colors.black87)),
          ),
          Row(
            children: equationInput,
          ),
          SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text('UNDER CONSTRAINT',
                style: TextStyle(color: Colors.black87)),
          ),
          Column(
            children: constraintInput,
          ),
          Row(
            children: [
              Expanded(child: BottomBackButton()),
              SizedBox(width: 60.0),
              Expanded(
                child: BottomNextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
