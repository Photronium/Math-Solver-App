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
          backgroundColor: Colors.white,
        ),
        drawer: DrawTab(),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(padding),
          children: <Widget>[
            PerformanceScore(),
            ScoreChart(),
            PerformanceHistory()
          ],
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
                  child:
                      Text("Score Analysis", style: TextStyle(fontSize: 20.0)),
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      for (var i = 0; i < scores.length; i++)
                        Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Column(children: <Widget>[
                                Container(
                                  color: Color.fromRGBO(0, 0, 0, 0),
                                  width: 4,
                                  height: 300 - scores[i] * 30,
                                ),
                                Container(
                                  color: Color.fromRGBO(
                                      50,
                                      (scores[i] * 25).toInt(),
                                      255,
                                      i % 16 == 0 ? 1 : 0.2),
                                  width: 4,
                                  height: scores[i] * 30,
                                ),
                              ])),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child:
                                Text(i % 16 == 0 ? scores[i].toString() : ""),
                          )
                        ])
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

class PerformanceHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PerformanceHistory();
  }
}

class _PerformanceHistory extends State<PerformanceHistory> {
  double average = 8;
  double oldAverage = 6.5;
  double difference = 0;

  void initState() {
    super.initState();
    difference = average / oldAverage - 1;
  }

  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
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
                  child: Text("Performance History",
                      style: TextStyle(fontSize: 20.0)),
                ),
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            color: Color.fromRGBO(
                                50, (average * 25).toInt(), 255, 1),
                            width: average * 25,
                            height: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            color: Color.fromRGBO(
                                50, (oldAverage * 25).toInt(), 255, 1),
                            width: oldAverage * 25,
                            height: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 26),
                        child: Row(children: <Widget>[
                          Text("You performed ",
                              style: TextStyle(fontSize: 16.0)),
                          Text((100 * difference).toInt().toString(),
                              style: TextStyle(fontSize: 19.0)),
                          Text(difference > 0 ? "% better" : "% worse",
                              style: TextStyle(fontSize: 16.0)),
                          Text(" than before", style: TextStyle(fontSize: 16.0))
                        ]),
                      ),
                    ],
                  ),
              ]),
          onPressed: () {
            print("Simplex");
          },
        ));
  }
}
