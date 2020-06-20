import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbercrunching/screen/problem_solving/number_input_field.dart';
import '../drawer.dart';
import 'bottom_button.dart';
import 'simplex_solver.dart';
import 'ps_3_input_var_con.dart';

class InputConstraintVariable extends StatefulWidget {
  @override
  _InputConstraintVariableState createState() => _InputConstraintVariableState();
}

class _InputConstraintVariableState extends State<InputConstraintVariable> {
  bool warnVariable = false;
  bool warnConstraints = false;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('NUMBER OF VARIABLES', style: TextStyle(color: Colors.black87)),
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '2-5',
                    errorText: warnVariable ? 'The input number must be in range 2 - 5' : null,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter.singleLineFormatter
                  ],
                  onChanged: (val) {
                    if (val.length >= 1) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                  controller: variableController,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('NUMBER OF CONSTRAINTS', style: TextStyle(color: Colors.black87)),
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '2-10',
                    errorText: warnConstraints ? 'The input number must be in range 2 - 10' : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter.singleLineFormatter
                  ],
                  onChanged: (val) {
                    if (val.length >= 2) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                  controller: constraintController,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: BottomBackButton(),
              ),
              SizedBox(width: 60.0),
              Expanded(
                child: BottomNextButton(onPressed: () {
                  var varInt = int.parse(variableController.text);
                  var conInt = int.parse(constraintController.text);
                  if(varInt >= 2 && varInt <= 5 && conInt >= 2 && conInt <= 10) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputConstraint()));
                  }
                  else {
                    if(varInt <= 2 || varInt > 10){
                      setState(() {
                        warnVariable = true;
                      });
                    }
                    else {
                      setState(() {
                        warnVariable = false;
                      });
                    }
                    if(conInt <= 2 || conInt > 7){
                      setState(() {
                        warnConstraints = true;
                      });
                    }
                    else {
                      setState(() {
                        warnConstraints = false;
                      });
                    }
                  }
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
