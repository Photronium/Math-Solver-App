import 'package:flutter/material.dart';

final variableController = TextEditingController();
final constraintController = TextEditingController();
final equationController = [];
final conditionController = [];
class SimplexSolver {
  List<int> equation = [];
  List<List<int>> condition = [];

  SimplexSolver(){
    for(int i = 0; i < int.parse(variableController.text); i++){
      equation.add(int.parse(equationController[i].text));
    }
    for(int i = 0; i < int.parse(constraintController.text); i++){
      List<int> oneCondition = [];
      for(int j = 0; j < int.parse(variableController.text) + 1; j++){
        oneCondition.add(int.parse(conditionController[i][j].text));
      }
      condition.add(oneCondition);
    }
  }

  String printEquation(){
    String equationString = "Y =";
    for(int i = 0; i < equation.length; i++){
      equationString += " ${equation[i]}X${i+1} ";
      if(i < equation.length - 1)
        equationString += "+";
    }
    return equationString;
  }

  String printCondition(){
    String conditionString = "";
    for(int i = 0; i < condition.length; i++){
      int j;
      for(j = 0; j < condition[i].length - 1; j++){
        conditionString += " ${condition[i][j]}X${j+1} ";
        if(j < condition[i].length - 2)
          conditionString += "+";
      }
      conditionString += "<= ${condition[i][j]} \n";
    }
    return conditionString;
  }


}