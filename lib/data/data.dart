import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screen/course_page.dart';

class Course {
  String _name;
  String _image;
  String _next;
  List<Type> _solutionList;

  Course({String name, String image, String next, List<Type> solutionList}){
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

  void setNext(String n){
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

  String getNext(){
    return this._next;
  }
}

class Type {
  String _name;
  String _description;
  String _image;
  String _next;

  Type({String name, String description, String image, String next}) {
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

  void setNext(String n){
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

  String getNext(){
    return this._next;
  }
}

//TODO: Define type
//TODO: Optimization declaration
Course optimization = Course(
  name: "Optimization",
  image: 'assets/images/optimization-icon.png',
  next:  '/optimization',
  solutionList: [
    Type(
        name: "Basic Simplex Method",
        description: "Using simplex method to solve problem with all positive input",
        image: "assets/images/iconSimplexMethod-06.png",
        next: '/solver/basic_simplex',
    ),
//    Type(
//        name: "Branch and Bound",
//        description: 'The "divide and conquer" method to solve LP with integer conditions',
//        image: "assets/images/iconBranchAndBound-06.png"
//    ),
//    Type(
//        name: "Cutting Plane",
//        description: "Refine a feasible set or objective function by means of linear inequalities",
//        image: "assets/images/iconCuttingPlane-06.png"
//    ),
  ],
);

Course sorting = Course(
  name: "Sorting",
  image: 'assets/images/sorting-icon.png',
  next: '/sorting',
  solutionList: [
    Type(
        name: "Quick Sort",
        description: "Picks an element as pivot and partitions the given array around the picked pivot.",
        image: "assets/images/iconSimplexMethod-06.png",
        next: '/solver/quick',
    ),
    Type(
        name: "Merge Sort",
        description: "Divides input array in two halves, calls itself for the two halves and then merges the two sorted halves",
        image: "assets/images/iconSimplexMethod-06.png",
        next: '/solver/merge',
    ),
  ],
);