import 'shared_resources.dart';
import 'package:flutter/material.dart';
import '../../drawer.dart';
const backgroundMainColor = Color(0xFFF2F2F2);

class BBLearningPageState extends State<BBLearningPage>{
  int _selectedIndex = 0;

  static List<Widget> _textDisplay = <Widget>[
    Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text('''Branch and Bound algorithm, as a method for global optimization for discrete problems, which are usually NP-hard, searches the complete space of solutions for a given problem for the optimal solution. By solving a relaxed problem of the original one, fractional solutions are recognized and for each discrete variable, B&B will do branching and creating two new nodes, thus dividing the solution space into a set of smaller subsets and obtain the relative upper and lower bound for each node. Since explicit enumeration is normally impossible due to the exponentially increasing number of potential solutions, the use of bounds for the function to be optimized combined with the value of the current best solution found enables this B&B algorithm to search only parts of the solution space implicitly.''',
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
        title: Text('Branch and Bound Method',
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

class BBLearningPage extends StatefulWidget{
  @override
  BBLearningPageState createState() => BBLearningPageState();
}