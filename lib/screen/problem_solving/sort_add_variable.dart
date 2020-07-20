import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/problem_solving/sort_num_variable.dart';
import 'bottom_button.dart';
import 'number_input_field.dart';
import 'sort_solver.dart';
import 'sort_result.dart';
import 'sort_num_variable.dart';

class SortingInputVariable extends StatefulWidget {
  final int type;
  SortingInputVariable({this.type});
  @override
  _SortingInputVariableState createState() => _SortingInputVariableState();
}

class _SortingInputVariableState extends State<SortingInputVariable> {
  List<Widget> equationInput = [];
  int numVar = int.parse(variableController.text);

  void setUp() {
    equationInput.clear();
  }

  void modifyInputVariable() {
    for (int i = 0; i < numVar; i++) {
      equationInput.add(Expanded(
          child: NumberInputField(controller: listVariableController[i])));
      equationInput.add(SizedBox(width: 3.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    setUp();
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
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('LIST OF ELEMENT' + widget.type.toString(),
                      style: TextStyle(color: Colors.black87)),
                ),
                Row(
                  children: equationInput,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: BottomBackButton()),
              SizedBox(width: 60.0),
              Expanded(
                child: BottomNextButton(
                  onPressed: () {
                    if(sortingController != null)
                      sortingController = null;
                    sortingController = new SortingController(widget.type);
                    sortingController.calculateSort();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SortingResultPage()));
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
