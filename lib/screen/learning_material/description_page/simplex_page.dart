
import 'shared_resources.dart';
import 'package:flutter/material.dart';
import '../../drawer.dart';

const backgroundMainColor = Color(0xFFF2F2F2);

class SimplexLearningPageState extends State<SimplexLearningPage> {
  int _selectedIndex = 0;

  static List<Widget> _textDisplay = <Widget>[
    Container(
      padding: const EdgeInsets.all(20.0),
      child: Text('''Simplex method, standard technique in linear programming for solving an optimization problem, typically one involving a function and several constraints expressed as inequalities. The inequalities define a polygonal region and the solution is typically at one of the vertices. The simplex method is a systematic procedure for testing the vertices as possible solutions. the simplex algorithm operates on linear program in the canonical form:''',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),

    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text(
        'This is example page',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text(
        'This is feedback page',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text(
        'This is solution page',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      appBar: AppBar(
        title: Text(
          'Simplex Method',
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

class SimplexLearningPage extends StatefulWidget {
  @override
  SimplexLearningPageState createState() => SimplexLearningPageState();
}
