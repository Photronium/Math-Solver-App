import 'package:flutter/material.dart';
import '../drawer.dart';

const double padding = 25;

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Dashboard', style: TextStyle(fontWeight: FontWeight.w300)),
          centerTitle: true,
        ),
        drawer: DrawTab(),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(padding),
          children: <Widget>[PerformanceScore(), ScoreChart()],
        ));
  }
}

class PerformanceScore extends StatelessWidget {
  var score = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350.0,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Performance Score", style: TextStyle(fontSize: 20.0)),
                Text(score.toString(), style: TextStyle(fontSize: 80)),
                Text("See more about how your score is calculated →",
                    style: TextStyle(fontSize: 14.0)),
              ]),
          onPressed: () {
            print("Simplex");
          },
        ));
  }
}

class ScoreChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScoreChart();
  }
}

class _ScoreChart extends State<ScoreChart> {
  List<double> scores = [6, 8, 10, 9, 5];
  List<double> original = [];

  @override
  List<double> createAvg() {
    List<double> result = [];
    for (var i = 0; i <= scores.length - 2; i++) {
      result.add(scores[i]);
      result.add((scores[i] + scores[i + 1]) / 2);
    }
    result.add(scores[scores.length - 1]);
    return result;
  }

  void initState() {
    super.initState();
    original = scores;
    for (var i = 0; i <= 3; i++) {
      scores = createAvg();
    }
  }

  Widget build(BuildContext context) {
    return Container(
        height: 500.0,
        padding: EdgeInsets.only(top: padding),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                child: Text("Score Analysis", style: TextStyle(fontSize: 20.0)),
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      for (var i in scores)
                        Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Column(children: <Widget>[
                                Container(
                                  color: Color.fromRGBO(0, 0, 0, 0),
                                  width: 4,
                                  height: 300 - i * 30,
                                ),
                                Container(
                                  color: Color.fromRGBO(50, (i * 25).toInt(),
                                      255, original.contains(i) ? 1 : 0.2),
                                  width: 4,
                                  height: i * 30,
                                ),
                              ])),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                          child: Text(original.contains(i) ? i.toString():""),
                          )
                        ]
                        )
                    ],
                  ),
                ),
                Text("See more about how your score is calculated →",
                    style: TextStyle(fontSize: 14.0)),
              ]),
          onPressed: () {
            print("Simplex");
          },
        ));
  }
}
