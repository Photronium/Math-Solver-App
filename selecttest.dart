import 'package:flutter/material.dart';
import 'package:numbercrunching/screen/testpage/do_test.dart';


class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  List<String> images = [
    'assets/images/iconSimplexMethod-06.png',
    'assets/images/iconBranchAndBound-06.png',
    'assets/images/iconCuttingPlane-06.png'
  ];

  List<String> description = [
    'The most basic method to solve Linear Program',
    'The "divide and conquer" method to solve LP with integer conditions',
    'Refine a feasible set or objective function by means of linear inequalities',
  ];

  Widget customcard(String method, String image, String description){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(method),
          ));
        },
        child: ListTile(
          leading: Image(
            image: AssetImage(image),
            height: 100.0,
          ),
          title: Text(method,
              style: TextStyle(fontSize: 20.0)),
          subtitle: Text(description,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w100)),
          trailing: Icon(Icons.navigate_next),
        ),
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
      body: ListView(
        children: <Widget>[
         Column(children: <Widget>[
          customcard("Simplex Method",images[0], description[0]),
          customcard("Branch And Bound Method",images[1], description[1]),
          customcard("Cutting Plane Method",images[2], description[2]),
          ],
         ),
        ]
     ),
    );
  }
}