import 'shared_resources.dart';
import 'package:flutter/material.dart';
import '../../drawer.dart';
const backgroundMainColor = Color(0xFFF2F2F2);

class CuttingPlaneLearningPageState extends State<CuttingPlaneLearningPage>{
  int _selectedIndex = 0;

  static List<Widget> _textDisplay = <Widget>[
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text('''Cutting-plane method is any of a variety of optimization methods that iteratively refine a feasible set or objective function by means of linear inequalities, termed cuts. Such procedures are commonly used to find integer solutions to mixed integer linear programming (MILP) problems, as well as to solve general, not necessarily differentiable convex optimization problems. The use of cutting planes to solve MILP was introduced by Ralph E. Gomory.''',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text('This is solution page',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text('This is example page',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text('This is feedback page',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    )
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      appBar: AppBar(
        title: Text('Cutting Plane Method',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: _textDisplay.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: myBottom,
        selectedItemColor: Colors.green,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CuttingPlaneLearningPage extends StatefulWidget{
  @override
  CuttingPlaneLearningPageState createState() => CuttingPlaneLearningPageState();
}