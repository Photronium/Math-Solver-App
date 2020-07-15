import 'package:flutter/material.dart';

final variableController = TextEditingController();
final constraintController = TextEditingController();
final matrixA = [];
final matrixB = [];
final matrixC = [];

class SimplexSolver {
  int rows, cols;
  List<List<double>> A; //stores coefficients of all the variables
  List<double> B; //stores constants of constraints
  List<double> C; //stores the coefficients of the objective function
  List<double> R; //store the result
  double maximum;
  bool isUnbounded;
  SimplexSolver(){
    maximum = 0;
    isUnbounded = false;
    rows = matrixA.length;
    cols = matrixA[0].length + matrixA.length;
    A = [];
    B = [];
    C = [];
    R = [];
    for (int i = 0; i < rows; i++) {
      List<double> smallA = [];
      for (int j = 0; j < cols - rows; j++) {
        smallA.add(int.parse(matrixA[i][j].text).toDouble());
      }
      for (int k = 0; k < rows; k++) {
        if (i == k) {
          smallA.add(1.0);
        } else {
          smallA.add(0.0);
        }
      }
      A.add(smallA);
    }

    for (int i = 0; i < matrixB.length; i++) {
      B.add(int.parse(matrixB[i].text).toDouble());
    }

    for (int i = 0; i < matrixC.length; i++) {
      C.add(-int.parse(matrixC[i].text).toDouble());
    }
    for (int i = matrixC.length; i < cols; i++) {
      C.add(0.0);
    }
  }

  bool simplexAlgorithmCalculataion() {
    //check whether the table is optimal,if optimal no need to process further
    if (checkOptimality() == true) {
      return true;
    }
    //find the column which has the pivot.The least coefficient of the objective function(C array).
    int pivotColumn = findPivotColumn();
    if (isUnbounded == true) {
      print("Error unbounded");
      return true;
    }
    //find the row with the pivot value.The least value item's row in the B array
    int pivotRow = findPivotRow(pivotColumn);
    //form the next table according to the pivot value
    doPivotting(pivotRow, pivotColumn);
    return false;
  }

  bool checkOptimality() {
    //if the table has further negative constraints,then it is not optimal
    bool isOptimal = false;
    int positiveValueCount = 0;
    //check if the coefficients of the objective function are negative
    for (int i = 0; i < C.length; i++) {
      double value = C[i];
      if (value >= 0) {
        positiveValueCount++;
      }
    }
    //if all the constraints are positive now,the table is optimal
    if (positiveValueCount == C.length) {
      isOptimal = true;
      print("");
    }
    return isOptimal;
  }

  void doPivotting(int pivotRow, int pivotColumn) {
    double pivotValue = A[pivotRow][pivotColumn]; //gets the pivot value

    List<double> pivotRowVals = []; //the column with the pivot

    List<double> pivotColVals = []; //the row with the pivot

    List<double> rowNew = []; //the row after processing the pivot value

    maximum = maximum - (C[pivotColumn] *
        (B[pivotRow] / pivotValue)); //set the maximum step by step
    //get the row that has the pivot value
    for (int i = 0; i < cols; i++) {
      pivotRowVals.add(A[pivotRow][i]);
    }
    //get the column that has the pivot value
    for (int j = 0; j < rows; j++) {
      pivotColVals.add(A[j][pivotColumn]);
    }

    //set the row values that has the pivot value divided by the pivot value and put into new row
    for (int k = 0; k < cols; k++) {
      rowNew.add(pivotRowVals[k] / pivotValue);
    }

    B[pivotRow] = B[pivotRow] / pivotValue;


    //process the other coefficients in the A array by subtracting
    for (int m = 0; m < rows; m++) {
      //ignore the pivot row as we already calculated that
      if (m != pivotRow) {
        for (int p = 0; p < cols; p++) {
          double multiplyValue = pivotColVals[m];
          A[m][p] = A[m][p] - (multiplyValue * rowNew[p]);
          //C[p] = C[p] - (multiplyValue*C[pivotRow]);
          //B[i] = B[i] - (multiplyValue*B[pivotRow]);
        }
      }
    }

    //process the values of the B array
    for (int i = 0; i < B.length; i++) {
      if (i != pivotRow) {
        double multiplyValue = pivotColVals[i];
        B[i] = B[i] - (multiplyValue * B[pivotRow]);
      }
    }
    //the least coefficient of the constraints of the objective function
    double multiplyValue = C[pivotColumn];
    //process the C array
    for (int i = 0; i < C.length; i++) {
      C[i] = C[i] - (multiplyValue * rowNew[i]);
    }


    //replacing the pivot row in the new calculated A array
    for (int i = 0; i < cols; i++) {
      A[pivotRow][i] = rowNew[i];
    }
  }

  //print the current A array
  void printA() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        print(A[i][j]);
      }
    }
  }

  //find the least coefficients of constraints in the objective function's position
  int findPivotColumn() {
    int location = 0;
    double minm = C[0];
    for (int i = 1; i < C.length; i++) {
      if (C[i] < minm) {
        minm = C[i];
        location = i;
      }
    }
    return location;
  }

  //find the row with the pivot value.The least value item's row in the B array
  int findPivotRow(int pivotColumn) {
    List<double> positiveValues = [];
//    std::vector<float> result(rows,0);
    List<double> result = [];
//    for (int i = 0; i < rows; i++) {
//      result.add(0.0);
//    }
    //float result[rows];
    int negativeValueCount = 0;

    for (int i = 0; i < rows; i++) {
      if (A[i][pivotColumn] > 0) {
        positiveValues.add(A[i][pivotColumn]);
      }
      else {
        positiveValues.add(0.0);
        negativeValueCount += 1;
      }
    }
    //checking the unbound condition if all the values are negative ones
    if (negativeValueCount == rows) {
      isUnbounded = true;
    }
    else {
      for (int i = 0; i < rows; i++) {
        double value = positiveValues[i];
        if (value > 0) {
          result.add(B[i] / value);
        }
        else {
          result.add(0.0);
        }
      }
    }
    //find the minimum's location of the smallest item of the B array
    double minimum = double.maxFinite;
    int location = 0;
    for (int i = 0; i < result.length; i++) {
      if (result[i] > 0) {
        if (result[i] < minimum) {
          minimum = result[i];
          location = i;
        }
      }
    }

    return location;
  }

  void calculateSimplex() {
    bool end = false;
    while (!end) {
      bool result = simplexAlgorithmCalculataion();
      if (result == true) {
        end = true;
      }
    }
    print("Answers for the Constraints of variables");

    for (int i = 0; i < A.length; i++) { //every basic column has the values, get it form B array
      int count0 = 0;
      int index = 0;
      for (int j = 0; j < rows; j++) {
        if (A[j][i] == 0.0) {
          count0 += 1;
        }
        else if (A[j][i] == 1) {
          index = j;
        }
      }

      if (count0 == rows - 1) {
        print("variable ${index + 1} : ${B[index]} \n"); //every basic column has the values, get it form B array
        R.add(B[index]);
      }
      else {
        print("variable ${index + 1} : 0 \n");
        R.add(0.0);
      }
    }
    print("maximum value: ${maximum} \n "); //print the maximum values
  }

  void printMatrix() {
    print("Matrix A");
    print(rows);
    print(cols);

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        print(A[i][j]);
      }
    }

    for (int i = 0; i < matrixB.length; i++) {
      print(B[i]);
    }

    for (int i = 0; i < cols; i++) {
      print(C[i]);
    }

    calculateSimplex();
    print(maximum);
  }

  String printEquation(){
    String temp = "Y = ";
    for(int i = 0; i < matrixC.length; i++){
      temp += matrixC[i].text + "X${i+1}";
      if(i + 1 != matrixC.length)
        temp += " + ";
    }
    return temp;
  }

  String printCondition(){
    String temp = "";
    for(int i = 0; i < matrixA.length; i++){
      for(int j = 0; j < matrixA[i].length; j++){
        temp += matrixA[i][j].text + "X${j+1}";
        if(j + 1 != matrixB.length)
          temp += " + ";
      }
      temp += " <= " + matrixB[i].text;
      temp += "\n";
    }
    return temp;
  }

  String printResult(){
    String temp = "Y = ${maximum} \n(";
    for(int i = 0; i < R.length; i++){
      temp += "X${i+1}";
      if(i + 1 != R.length)
        temp += " , ";
    }
    temp += ") = (";
    for(int i = 0; i < matrixC.length; i++){
      temp += R[i].toString();
      if(i + 1 != matrixC.length)
        temp += " , ";
    }
    temp += ")";
    return temp;
  }
}