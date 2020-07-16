import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numbercrunching/screen/problem_solving/ps_1_method.dart';
import 'test_page/selecttest.dart';
import 'learning_material/learning_material.dart';
import 'drawer.dart';

class CoursePage extends StatefulWidget {
  final String title;
  CoursePage({Key key, this.title}) : super(key : key);
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LESSON'),
    Tab(text: 'TEST'),
    Tab(text: 'SOLVER'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      drawer: DrawTab(),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text.toLowerCase();
          if(label == "solver")
            return ProblemSolvingPage(title: widget.title);
          else if(label == "test")
            return TestPage();
          else return LearningMaterialPage();
        }).toList(),
      ),
    );
  }
}

