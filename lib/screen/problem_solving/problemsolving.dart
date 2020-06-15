import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'component.dart';
import 'bottom_button.dart';

class ProblemSolvingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem Solving',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(children: <Widget>[
            Container(
                height: 100.0,
                margin: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    leading: Image(
                      image:
                          AssetImage('assets/images/iconSimplexMethod-06.png'),
                      height: 100.0,
                    ),
                    title: Text("Simplex Method",
                        style: TextStyle(fontSize: 20.0)),
                    subtitle: Text(
                        "The most basic method to solve Linear Program",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w100)),
                    trailing: Icon(Icons.navigate_next),
                  ),
                  onPressed: () {
                    print("Simplex");
                  },
                )),
            Container(
                height: 100.0,
                margin: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    leading: Image(
                      image: AssetImage(
                          'assets/images/iconBranchAndBound-06.png'),
                      height: 100.0,
                    ),
                    title: Text("Branch and Bound",
                        style: TextStyle(fontSize: 20.0)),
                    subtitle: Text(
                        'The "divide and conquer" method to solve LP with integer conditions',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w100)),
                    trailing: Icon(Icons.navigate_next),
                  ),
                  onPressed: () {
                    print("Branch and Bound");
                  },
                )),
            Container(
                height: 100.0,
                margin: EdgeInsets.all(15.0),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.white,
                  onPressed: () {
                    print("Cutting Plane");
                  },
                  child: ListTile(
                    leading: Image(
                      image:
                      AssetImage('assets/images/iconCuttingPlane-06.png'),
                      height: 100.0,
                    ),
                    title: Text("Cutting Plane",
                        style: TextStyle(fontSize: 20.0)),
                    subtitle: Text(
                        "Refine a feasible set or objective function by means of linear inequalities",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w100)),
                    trailing: Icon(Icons.navigate_next),
                  ),
                )),
          ]),
          BottomBackButton(),
        ],
      ),
    );
  }
}
