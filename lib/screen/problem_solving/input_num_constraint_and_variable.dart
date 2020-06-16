import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../drawer.dart';
import 'bottom_button.dart';
import 'simplex_solve.dart';
import 'input_constraint.dart';

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
                  child: Text('Number of variables'),
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '0-10',
                    errorText: warnVariable ? 'The input number must be in range 0 - 10' : null,
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
                  validator: (val) {
                    var valInt = int.parse(val);
                    if (valInt <= 0 || valInt > 10) {
                      return "The input number must be in range 0-10";
                    }
                    else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    if (val.length >= 2) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                  controller: variableController,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Number of variables'),
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '0-10',
                    errorText: warnConstraints ? 'The input number must be in range 0 - 10' : null,
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
                  if(varInt > 0 && varInt <= 20 && conInt > 0 && conInt <= 20) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputConstraint()));
                  }
                  else {
                    if(varInt <= 0 || varInt > 20){
                      setState(() {
                        warnVariable = true;
                      });
                    }
                    else {
                      setState(() {
                        warnVariable = false;
                      });
                    }
                    if(conInt <= 0 || conInt > 20){
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
