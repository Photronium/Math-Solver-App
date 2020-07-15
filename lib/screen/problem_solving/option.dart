import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/problem_solving/ps_2_input_numVar_numCon.dart';

class Type {
  String _name;
  String _description;
  String _image;

  Type({String name, String description, String image}) {
    this._name = name;
    this._description = description;
    this._image = image;
  }

  void setName(String n) {
    n = this._name;
  }

  void setDescription(String d) {
    d = this._description;
  }

  void setImage(String i) {
    i = this._image;
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
}
//TODO: Define type
final List<Type> typeList = [
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
  Type(
      name: "Soon available",
      description: "This is a testing function",
      image : "assets/images/iconCuttingPlane-06.png"
  ),
  Type(
      name: "Soon available",
      description: "This is a testing function",
      image : "assets/images/iconCuttingPlane-06.png"
  ),
  Type(
      name: "Soon available",
      description: "This is a testing function",
      image : "assets/images/iconCuttingPlane-06.png"
  ),
];

class OptionWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> typeListWidget = List<Widget>();
    for (int i = 0; i < typeList.length; i++) {
      print(typeList[i].getName());
      print(typeList[i].getDescription());
      print(typeList[i].getImage());
      Container optionElement = new Container(
          height: 100.0,
          margin: EdgeInsets.all(15.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            child: ListTile(
              leading: Image(
                image: AssetImage(typeList[i].getImage()),
                height: 100.0,
              ),
              title:
                  Text(typeList[i].getName(), style: TextStyle(fontSize: 18.0)),
              subtitle: Text(typeList[i].getDescription(),
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.w100)),
              trailing: Icon(Icons.navigate_next),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InputConstraintVariable()));
            },
          )
      );
      typeListWidget.add(optionElement);
    }
    return Column(
      children: typeListWidget,
    );
  }
}