import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'bottom_button.dart';
import 'sort_solver.dart';
import 'sort_add_variable.dart';

SortingController sortingController;

class SortingInputNumVariable extends StatefulWidget {
  final int type;
  SortingInputNumVariable({this.type});
  @override
  _SortingInputNumVariableState createState() => _SortingInputNumVariableState();
}

class _SortingInputNumVariableState extends State<SortingInputNumVariable> {
  bool warnVariable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Problem Solving'),
        centerTitle: true,
      ),
//      drawer: DrawTab(),
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
                  child: Text('NUMBER OF ELEMENTS', style: TextStyle(color: Colors.black87)),
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '3-10',
                    errorText: warnVariable ? 'The input number must be in range 3 - 10' : null,
                    fillColor: Colors.white,
                    filled: true,
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
                  controller: variableController,
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
                  if(varInt >= 3 && varInt <= 10) {
//                    if(simplexController != null){
//                      simplexController = null;
//                    }
//                    simplexController = new SimplexController();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SortingInputVariable(type: widget.type)));
                  }
                  else {
                    warnVariable = true;
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
