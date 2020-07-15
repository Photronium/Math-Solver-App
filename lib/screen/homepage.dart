import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'learning_material/learning_material.dart';

class DashOption extends StatelessWidget {
  String image;
  String title;
  Widget next;

  DashOption({this.image, this.title, this.next});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
//        borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(10),
//            topRight: Radius.circular(10),
//            bottomLeft: Radius.circular(10),
//            bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => next));
          },
          child: Column(
            children: [Image(image: AssetImage(image)), Text(title)],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 5.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hello Anonymous",
                          style: TextStyle(fontSize: 30.0))),
                  SizedBox(height: 5.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("What would you like to learn today?"),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                DashOption(
                  image: 'assets/images/optimization-icon.png',
                  title: 'Optimization',
                  next: LearningMaterialPage(),
                ),
                SizedBox(width: 15.0),
                DashOption(
                  image: 'assets/images/sorting-icon.png',
                  title: 'Sorting',
                  next: LearningMaterialPage(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(child: Container())
              ],
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(child: Container())
              ],
            )
          ],
        ),
      ),
    );
  }
}
