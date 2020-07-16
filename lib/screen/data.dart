import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coursetab.dart';

class Course {
  String _name;
  String _image;
  Widget _next;
  List<Type> _solutionList;

  Course({String name, String image, Widget next, List<Type> solutionList}){
    this._name = name;
    this._image = image;
    this._next = next;
    this._solutionList = solutionList;
  }

  void setName(String n){
    this._name = n;
  }

  void setImage(String i){
    this._image = i;
  }

  void setNext(Widget n){
    this._next = n;
  }

  String getName(){
    return this._name;
  }

  String getImage(){
    return this._image;
  }

  List<Type> getTypeList(){
    return this._solutionList;
  }

  Widget getNext(){
    return this._next;
  }
}

class Type {
  String _name;
  String _description;
  String _image;
  Widget _next;

  Type({String name, String description, String image, Widget next}) {
    this._name = name;
    this._description = description;
    this._image = image;
    this._next = next;
  }

  void setName(String n) {
    this._name = n;
  }

  void setDescription(String d) {
    this._description = d;
  }

  void setImage(String i) {
    this._image = i;
  }

  void setNext(Widget n){
    this._next = n;
  }

  String getName() {
    return this._name;
  }

  String getDescription() {
    return this._description;
  }

  String getImage() {
    return this._image;
  }

  Widget getNext(){
    return this._next;
  }
}
//TODO: Define type

//TODO: Optimization declaration
Course optimization = Course(
  name: "Optimization",
  image: 'assets/images/optimization-icon.png',
  next:  CoursePage(title: 'Optimization'),
  solutionList: [
    Type(
        name: "Simplex Method",
        description: "The most basic method to solve Linear Program",
        image: "assets/images/iconSimplexMethod-06.png"
    ),
    Type(
        name: "Branch and Bound",
        description: 'The "divide and conquer" method to solve LP with integer conditions',
        image: "assets/images/iconBranchAndBound-06.png"
    ),
    Type(
        name: "Cutting Plane",
        description: "Refine a feasible set or objective function by means of linear inequalities",
        image: "assets/images/iconCuttingPlane-06.png"
    ),
  ],
);

Course sorting = Course(
  name: "Sorting",
  image: 'assets/images/sorting-icon.png',
  next: CoursePage(title: 'Sorting'),
  solutionList: [
    Type(
        name: "Quick Sort",
        description: "First sorting algorithm",
        image: "assets/images/iconSimplexMethod-06.png"
    ),
    Type(
        name: "Merge Sort",
        description: "Second sorting algorithm",
        image: "assets/images/iconSimplexMethod-06.png"
    ),
  ],
);