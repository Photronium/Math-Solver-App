import 'package:flutter/material.dart';
import '../../drawer.dart';

const backgroundMainColor = Color(0xFFF2F2F2);

class SimplexLearningPageState extends State<SimplexLearningPage> {
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
    );
  }
}

class SimplexLearningPage extends StatefulWidget {
  @override
  SimplexLearningPageState createState() => SimplexLearningPageState();
}
