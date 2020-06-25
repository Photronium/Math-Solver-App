import 'package:flutter/material.dart';
import '../../drawer.dart';
const backgroundMainColor = Color(0xFFF2F2F2);

class CuttingPlaneLearningPageState extends State<CuttingPlaneLearningPage>{
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
    );
  }
}

class CuttingPlaneLearningPage extends StatefulWidget{
  @override
  CuttingPlaneLearningPageState createState() => CuttingPlaneLearningPageState();
}