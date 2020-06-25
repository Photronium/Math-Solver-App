import 'package:flutter/material.dart';

final variableController = TextEditingController();
final constraintController = TextEditingController();
final equationController = [];
final conditionController = [];
class SimplexSolver {
  List<int> _equation = [];
  List<List<int>> _condition = [];

  List<int> getEquation(){
    return _equation;
  }

  List<List<int>> getCondition(){
    return _condition;
  }

  void addEquation(int a){
    _equation.add(a);
  }

  void addCondition(List<int> a){
    _condition.add(a);
  }

  SimplexSolver(){
    for(int i = 0; i < int.parse(variableController.text); i++){
      addEquation(int.parse(equationController[i].text));
    }
    for(int i = 0; i < int.parse(constraintController.text); i++){
      List<int> oneCondition = [];
      for(int j = 0; j < int.parse(variableController.text) + 1; j++){
        oneCondition.add(int.parse(conditionController[i][j].text));
      }
      addCondition(oneCondition);
    }
  }

  String printEquation(){
    String equationString = "Y =";
    for(int i = 0; i < getEquation().length; i++){
      equationString += " ${getEquation()[i]}X${i+1} ";
      if(i < getEquation().length - 1)
        equationString += "+";
    }
    return equationString;
  }

  int checkNegation(List<int> a){
    int least = 0, least_idx = -1;
    for(int i = 0; i < a.length - 1; i++){
      if(least > a[i]){
        least == a[i];
        least_idx = i;
      }
    }
    return least_idx;
  }

  int choosePivot(List<List<int>> a, int least_idx){

  }

  void solve(){
    //Set up the matrix
    List<List<int>> matrix = List<List<int>>.from(getCondition());
    List<int> equation_matrix = List<int>.from(getEquation());
    for(int i = 0; i < equation_matrix.length; i++){
      equation_matrix[i] *= -1;
    }
    equation_matrix.add(0);
    matrix.add(equation_matrix);

  }

  String printCondition(){
    String conditionString = "";
    for(int i = 0; i < getCondition().length; i++){
      int j;
      for(j = 0; j < getCondition()[i].length - 1; j++){
        conditionString += " ${getCondition()[i][j]}X${j+1} ";
        if(j < getCondition()[i].length - 2)
          conditionString += "+";
      }
      conditionString += "<= ${getCondition()[i][j]} \n";
    }
    return conditionString;
  }


}