import 'package:flutter/material.dart';
import '../drawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: <Widget>[
          PerformanceScore()
        ],
      )
    );
  }
}

class PerformanceScore extends StatelessWidget {
  var score = 8;
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 500.0,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Performance Score",
                        style: TextStyle(fontSize: 20.0)),
                    Text(
                        score.toString(),
                        style: TextStyle(fontSize: 80)),
                    Text("See more about how your score is calculated →",
                        style: TextStyle(fontSize: 14.0)),
                  ]),
                  onPressed: () {
                    print("Simplex");
                  },
                ));
  }
}