import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/problem_solving/simplex_result.dart';

import '../drawer.dart';
import 'bottom_button.dart';
import 'number_input_field.dart';
import 'simplex_num_variable_constraint.dart';
import 'simplex_solver.dart';

class SimplexInputConstraint extends StatefulWidget {
  @override
  _SimplexInputConstraintState createState() => _SimplexInputConstraintState();
}

class _SimplexInputConstraintState extends State<SimplexInputConstraint> {
  List<Widget> equationInput = [];
  List<Widget> constraintInput = [];
  int numVar = int.parse(variableController.text);
  int numCon = int.parse(constraintController.text);

  void setUp() {
    simplexController.setNum();
    simplexController.addEditingController();
    equationInput.clear();
    constraintInput.clear();
  }

  void modifyInputVariable() {
    int init = matrixC.length;
    equationInput.add(Expanded(child: Center(child: Text("Y = "))));
    for (int i = 0; i < numVar; i++) {
      String temp = "X${i + 1}";
      if (i + 1 != numVar) {
        temp += " + ";
      }
//      if (i >= init) {
//        matrixC.add(TextEditingController());
//      }
        equationInput
            .add(Expanded(child: NumberInputField(controller: matrixC[i])));
        equationInput.add(Expanded(child: Center(child: Text(temp))));
    }
  }

  void modifyInputConstraint() {
    int initA = matrixA.length;
    int initB = matrixB.length;
    for (int i = 0; i < numCon; i++) {
      List<Widget> constraint = [];
      matrixA.add([]);
      for (int j = 0; j < numVar; j++) {
        String temp = "X${j + 1}";
        if (j + 1 != numVar) {
          temp += " + ";
        }
//        if (j >= initA) {
//          matrixA[i].add(TextEditingController());
//        }
        constraint
            .add(Expanded(child: NumberInputField(controller: matrixA[i][j])));
        constraint.add(Expanded(child: Center(child: Text(temp))));
      }
      constraint.add(Expanded(child: Center(child: Text("<="))));
//      if(i >= initB) {
//        matrixB.add(TextEditingController());
//      }
      constraint.add(Expanded(
          child: NumberInputField(controller: matrixB[i])));
      constraintInput.add(Row(children: constraint));
      constraintInput.add(SizedBox(height: 10.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    setUp();
    modifyInputConstraint();
    modifyInputVariable();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Problem Solving'),
        centerTitle: true,
      ),
//      drawer: DrawTab(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              //crossAxisAlignment: CrossAxisAlignment.start,
              child: Column(
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
                  SizedBox(height: 500.0),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(child: BottomBackButton()),
              SizedBox(width: 60.0),
              Expanded(
                child: BottomNextButton(
                  onPressed: () {
                    if(simplexController.simplexSolver != null)
                      simplexController.simplexSolver = null;
                    simplexController.createSimplexSolver();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultPage()));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}