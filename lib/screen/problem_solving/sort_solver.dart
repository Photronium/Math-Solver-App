import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final variableController = TextEditingController();
final listVariableController = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

class SortingController {
  int type;
  MergeSortSolver mergeSortSolver = null;
  QuickSortSolver quickSortSolver = null;
  SortingController(int type) {
    this.type = type;
    if(type == 1){
      quickSortSolver = new QuickSortSolver();
    }
    else if(type == 2){
      mergeSortSolver = new MergeSortSolver();
    }
  }
  String printBefore(){
    if(type == 1){
      //return quickSortSolver.printBefore();
    }
    else if(type == 2){
      return mergeSortSolver.printBefore();
    }
    else return "NO RESULT";
  }
  String printAfter(){
    if(type == 1){
      //return quickSortSolver.printBefore();
    }
    else if(type == 2){
      return mergeSortSolver.printAfter();
    }
    else return "NO RESULT";
  }
  String printHint(){
    if(type == 1){
      //return quickSortSolver.printBefore();
    }
    else if(type == 2){
      return mergeSortSolver.printHint();
    }
    else return "NO HINT";
  }
  String printStepCount(){
    if(type == 1){
      //return quickSortSolver.printBefore();
    }
    else if(type == 2){
      return mergeSortSolver.printStepCount();
    }
    else return "0";
  }
  void calculateSort(){
    if(type == 1){
      //return quickSortSolver.printBefore();
    }
    else if(type == 2){
      mergeSortSolver.mergeSort();
    }
  }
}

class MergeSortSolver {
  List<int> arr;
  int numElement;
  int stepCount = 0;
  String hint = "";
  MergeSortSolver() {
    arr = [];
    numElement = int.parse(variableController.text);
    print(numElement);
    for (int i = 0; i < numElement; i++) {
      arr.add(int.parse(listVariableController[i].text));
    }
  }

  void mergeSort() {
    sort(0, arr.length - 1);
  }

  String printBefore(){
    String temp = "(";
    for(int i = 0; i < numElement; i++){
      temp += listVariableController[i].text;
      if(i + 1 != numElement){
        temp += " , ";
      }
    }
    temp += ")";
    return temp;
  }

  String printAfter(){
    String temp = "(";
    for(int i = 0; i < numElement; i++){
      temp += arr[i].toString();
      if(i + 1 != numElement){
        temp += " , ";
      }
    }
    temp += ")";
    return temp;
  }

  void merge(int l, int m, int r) {
    // Find sizes of two subarrays to be merged
    int n1 = m - l + 1;
    int n2 = r - m;

    /* Create temp arrays */
    List<int> L = [];
    List<int> R = [];

    /*Copy data to temp arrays*/
    for (int i = 0; i < n1; ++i) L.add(arr[l + i]);
    for (int j = 0; j < n2; ++j) R.add(arr[m + 1 + j]);

    /* Merge the temp arrays */

    // Initial indexes of first and second subarrays
    int i = 0, j = 0;

    // Initial index of merged subarry array
    int k = l;
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        arr[k] = L[i];
        i++;
      } else {
        arr[k] = R[j];
        j++;
      }
      k++;
    }

    /* Copy remaining elements of L[] if any */
    while (i < n1) {
      arr[k] = L[i];
      i++;
      k++;
    }

    /* Copy remaining elements of R[] if any */
    while (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
    }

    hint += "   We have (";
    for(int i = 0; i < numElement; i++){
      hint += arr[i].toString();
      if(i+1 != numElement){
        hint += " , ";
      }
    }
    hint += ")\n";
  }

  // Main function that sorts arr[l..r] using
  // merge()
  void sort(int l, int r) {
    if (l < r) {
      // Find the middle point
      int m = (l + r) ~/ 2;
      hint += "In sort ($l, $r){\n";
      stepCount++;
      if(l < m)
        hint += "   Sort the first half from $l to $m\n";
      // Sort first and second halves
      sort(l, m);
      if(m + 1 < r)
        hint += "   Sort the second half from ${m+1} to $r\n";
      sort(m + 1, r);
      hint += "   Merge the sorted halves in ($l, $m) with (${m+1}, $r).";
      // Merge the sorted halves
      merge(l, m, r);
      hint += "} finished sort ($l, $r)\n\n";
    }
  }

  String printHint(){
    return hint;
  }

  String printStepCount(){
    return stepCount.toString();
  }
}

class QuickSortSolver {

}
