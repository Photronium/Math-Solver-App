import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/test_page/showresult.dart';

import '../drawer.dart';

class GetJson extends StatelessWidget {

  String method;

  GetJson(this.method);

  String methodchosen;

  setasset() {
    if (method == "Simplex Method") {methodchosen = "assets/json/simplex.json";}

    else if (method == "Branch And Bound Method") {methodchosen = "assets/json/branch.json";}

    else if (method == "Cutting Plane Method") {methodchosen = "assets/json/cutting.json";}
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(methodchosen, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading",),
            ),
          );
        }
        else {return QuizPage(mydata: mydata);}
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  var mydata;

  QuizPage({Key key, @required this.mydata}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  var mydata;

  _QuizPageState(this.mydata);

  Color colortoshow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int j = 1;
  bool canceltimer = false;
  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.blue,
    "b": Colors.blue,
    "c": Colors.blue,
    "d": Colors.blue,
  };

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random() ;
    for (int i = 0;;) {
      int number;
      number = rand.nextInt(10) + 1;
      distinctIds.add(number);
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {continue;}

      else {break;}
    }
    print(random_array);
  }

  @override
  void initState() {
    startTimeout();
    genrandomarray();
    i= random_array[0];
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {super.setState(fn);}
  }

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds)
        {
          timer.cancel();
          canceltimer = true;
          j = 11;
        }
      });
    });
  }

  void nextquestion() {
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;}

      else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.blue;
      btncolor["b"] = Colors.blue;
      btncolor["c"] = Colors.blue;
      btncolor["d"] = Colors.blue;
    });
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 1;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    // changed timer duration to 1 second
    Timer(Duration(seconds: 1), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(mydata[1][i.toString()][k],
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )
        ),
        color: btncolor[k],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(mydata[0][i.toString()],
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  choicebutton('a'),
                  choicebutton('b'),
                  choicebutton('c'),
                  choicebutton('d'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(timerText,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}