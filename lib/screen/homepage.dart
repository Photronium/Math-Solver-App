import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem Solving'),
        centerTitle: true,
      ),
      drawer: DrawTab(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: FlatButton(
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text("Simplex Method", style: TextStyle(fontSize: 20.0)),
                    subtitle: Text("\nThe most basic method to solve Linear Program"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                onPressed: (){
                  print("Simplex");
                },
              )
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: FlatButton(
                  child: Center(
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text("Branch and Bound", style: TextStyle(fontSize: 20.0)),
                      subtitle: Text('\nThe "divide and conquer" method to solve LP with integer conditions'),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  onPressed: (){
                    print("Branch and Bound");
                  },
                )
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: FlatButton(
                  child: Center(
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text("Cutting Plane", style: TextStyle(fontSize: 20.0)),
                      subtitle: Text("\nRefine a feasible set or objective function by means of linear inequalities"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  onPressed: (){
                    print("Cutting Plane");
                  },
                )
            ),
          ),
          SizedBox(height: 10.0,),
          ButtonTheme(
            minWidth: double.infinity,
            height: 60.0,
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                "BACK",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )
              ),
              onPressed: (){
                print("BACK");
              }
            ),
          )
        ],
      )
    );
  }
}
