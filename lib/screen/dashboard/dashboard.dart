import 'package:flutter/material.dart';
import '../drawer.dart';

const double padding = 25;

class DataReader {
  String defaultt = "All Time";
  List<double> allTime = [];
  List<double> lastYear = [];
  List<double> lastMonth = [];
  List<double> lastWeek = [];

  void updateScore() {
    this.allTime = [4.5, 8.5, 3.5, 9.6, 3.3, 10];
    this.lastYear = [8.5, 3.5, 9.6, 3.3, 10];
    this.lastMonth = [3.5, 9.6, 3.3, 10];
    this.lastWeek = [9.6, 3.3, 10];
  }

  List<double> getScore() {
    updateScore();
    if (defaultt == "All Time") return allTime;
    if (defaultt == "Last Year") return lastYear;
    if (defaultt == "Last Month") return lastMonth;
    if (defaultt == "Last Week") return lastWeek;
  }

  List<double> getSpecificScore(String type) {
    updateScore();
    if (type == "All Time") return allTime;
    if (type == "Last Year") return lastYear;
    if (type == "Last Month") return lastMonth;
    if (type == "Last Week") return lastWeek;
  }

  double getAverage() {
    List<double> array = getScore();
    return getSpecificAverage(array);
  }

  double getSpecificAverage(List<double> array) {
    double total = 0;
    for (var i = 0; i < array.length; i++) {
      total += array[i];
    }
    return total / array.length;
  }

  void switchMode() {
    if (defaultt == "All Time")
      defaultt = "Last Year";
    else if (defaultt == "Last Year")
      defaultt = "Last Month";
    else if (defaultt == "Last Month")
      defaultt = "Last Week";
    else if (defaultt == "Last Week") defaultt = "All Time";
  }
}

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
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
            PerformanceHistory(),
            ScorePredictor()
          ],
        ));
  }
}

class PerformanceScore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PerformanceScore();
  }
}

class _PerformanceScore extends State<PerformanceScore> {
  DataReader userData = DataReader();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.blue, Colors.greenAccent],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 120.0, 120.0));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320.0,
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
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      userData.getAverage().toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 140.0,
                          foreground: Paint()..shader = linearGradient),
                    )),
                Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      userData.defaultt,
                      style: TextStyle(
                          fontSize: 20.0,
                          foreground: Paint()..shader = linearGradient),
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "You're doing great, but we think you can go further!",
                      style: TextStyle(fontSize: 16.0)),
                ),
              ]),
          onPressed: () {
            setState(() {
              userData.switchMode();
            });
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
  DataReader userData = DataReader();
  List<double> chartValues;

  @override
  List<double> createAvg() {
    List<double> result = [];
    for (var i = 0; i < chartValues.length - 1; i++) {
      result.add(chartValues[i]);
      result.add((chartValues[i] + chartValues[i + 1]) / 2);
    }
    result.add(chartValues[chartValues.length - 1]);
    return result;
  }

  void reDraw(List<double> array) {
    chartValues = array;
    for (var i = 0; i <= 3; i++) {
      chartValues = createAvg();
    }
  }

  void initState() {
    super.initState();
    reDraw(userData.getScore());
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
                      for (var i = 0; i < chartValues.length; i++)
                        Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Column(children: <Widget>[
                                Container(
                                  color: Color.fromRGBO(0, 0, 0, 0),
                                  width: 4,
                                  height: 300 - chartValues[i] * 30,
                                ),
                                Container(
                                  color: Color.fromRGBO(
                                      50,
                                      (chartValues[i] * 25).toInt(),
                                      255,
                                      i % 16 == 0 ? 1 : 0.2),
                                  width: 4,
                                  height: chartValues[i] * 30,
                                ),
                              ])),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                                i % 16 == 0 ? chartValues[i].toString() : ""),
                          )
                        ])
                    ],
                  ),
                ),
                Text(
                  userData.defaultt,
                  style: TextStyle(fontSize: 14.0),
                ),
              ]),
          onPressed: () {
            setState(() {
              userData.switchMode();
              reDraw(userData.getScore());
            });
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
  DataReader userData = DataReader();
  double average = 8;
  double oldAverage = 6.5;
  double difference = 0;

  void initState() {
    super.initState();
    calculate();
  }

  void calculate() {
    average = userData.getAverage();
    List<double> oldData = userData.getScore();
    oldData.removeLast();
    oldAverage = userData.getSpecificAverage(oldData);
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

class ScorePredictor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScorePredictor();
  }
}

class _ScorePredictor extends State<ScorePredictor> {
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
                  child: Text("The Future", style: TextStyle(fontSize: 20.0)),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 26),
                      child: Row(children: <Widget>[
                        Flexible(
                          child: Text(
                              "We think you next test score will be 9.5. Don't let this affect your actual result.",
                              style: TextStyle(fontSize: 16.0)),
                        ),
                      ]),
                    )
                  ],
                ),
              ]),
          onPressed: () {
            print("Simplex");
          },
        ));
  }
}
