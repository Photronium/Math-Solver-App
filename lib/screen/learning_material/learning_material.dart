import 'package:flutter/material.dart';

import 'description_page/b&b_page.dart';
import 'description_page/cuttingPlane_page.dart';
import 'description_page/simplex_page.dart';

const PrimaryColor = const Color(0xFF3786FF);
const backgroundMainColor = Color(0xFFF2F2F2);

List<Widget> buildMethod(BuildContext context) {
  return <Widget>[
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
            image: AssetImage('assets/images/iconSimplexMethod-06.png'),
            height: 100.0,
          ),
          title: Text("Simplex Method", style: TextStyle(fontSize: 18.0)),
          subtitle: Text("The most basic method to solve Linear Program",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.normal)),
          trailing: Icon(Icons.navigate_next),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SimplexLearningPage()));
        },
      ),
      key: Key("Simplex Method"),
    ),
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
            image: AssetImage('assets/images/iconBranchAndBound-06.png'),
            height: 100.0,
          ),
          title: Text("Branch and Bound", style: TextStyle(fontSize: 18.0)),
          subtitle: Text(
              'The "divide and conquer" method to solve LP with integer conditions',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.normal)),
          trailing: Icon(Icons.navigate_next),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BBLearningPage()));
        },
      ),
      key: Key("Branch and Bound Method"),
    ),
    Container(
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CuttingPlaneLearningPage()));
        },
        child: ListTile(
          leading: Image(
            image: AssetImage('assets/images/iconCuttingPlane-06.png'),
            height: 100.0,
          ),
          title: Text("Cutting Plane", style: TextStyle(fontSize: 18.0)),
          subtitle: Text(
              "Refine a feasible set or objective function by means of linear inequalities",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.normal)),
          trailing: Icon(Icons.navigate_next),
        ),
      ),
      key: Key("Cutting Plane Method"),
    ),
  ];
}

List<Widget> methodList = [
  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Container(
      height: 90.0,
      margin: EdgeInsets.all(0.0),
      child: ListTile(
        leading: Image(
          image: AssetImage('assets/images/iconSimplexMethod-06.png'),
          height: 100.0,
        ),
        title: Text('Simplex', style: TextStyle(fontSize: 20.0)),
        subtitle: Text('The most basic method to solve linear program.'),
        trailing: Icon(Icons.navigate_next),
      ),
    ),
    key: Key("Simplex Method"),
  ),
  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Container(
      height: 90.0,
      margin: EdgeInsets.all(0.0),
      child: ListTile(
        leading: Image(
          image: AssetImage('assets/images/iconBranchAndBound-06.png'),
//                    height: 100.0,
        ),
        title:
        Text('Branch and Bound Method', style: TextStyle(fontSize: 20.0)),
        subtitle: Text(
            'The divide and conquer algorithm to solve linear integer program.'),
        onTap: () {},
        trailing: Icon(Icons.navigate_next),
      ),
    ),
    key: Key('Branch and Bound Method'),
  ),
  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Container(
      height: 90.0,
      margin: EdgeInsets.all(0.0),
      child: ListTile(
        leading: Image(
          image: AssetImage('assets/images/iconCuttingPlane-06.png'),
          height: 100.0,
        ),
        title: Text('Cutting Plane Method', style: TextStyle(fontSize: 20.0)),
        subtitle: Text(
            'Refine a feasible or objective functions by means of inequalities.'),
        onTap: () {},
        trailing: Icon(Icons.navigate_next),
      ),
    ),
    key: Key('Cutting Plane Method'),
  ),
];

class LearningMaterialPageState extends State<LearningMaterialPage> {
  Widget _buildSuggestions(BuildContext context) {
    return Column(children: <Widget>[
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
                image: AssetImage('assets/images/iconSimplexMethod-06.png'),
                height: 100.0,
              ),
              title: Text("Simplex Method",),
              subtitle: Text("The most basic method to solve Linear Program",  style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 10.0)
                  ),
              trailing: Icon(Icons.navigate_next),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SimplexLearningPage()));
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
                image: AssetImage('assets/images/iconBranchAndBound-06.png'),
                height: 100.0,
              ),
              title: Text("Branch and Bound", style: TextStyle(fontSize: 18.0)),
              subtitle: Text(
                  'The "divide and conquer" method to solve LP with integer conditions',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 10.0)),
              trailing: Icon(Icons.navigate_next),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BBLearningPage()));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CuttingPlaneLearningPage()));
            },
            child: ListTile(
              leading: Image(
                image: AssetImage('assets/images/iconCuttingPlane-06.png'),
                height: 100.0,
              ),
              title: Text("Cutting Plane", style: TextStyle(fontSize: 18.0)),
              subtitle: Text(
                  "Refine a feasible set or objective function by means of linear inequalities",
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.normal, fontSize: 10.0)),
              trailing: Icon(Icons.navigate_next),
            ),
          )),
    ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0),child: Text("Optimization")),
            _buildSuggestions(context),
          ],
        ),
    );
  }
}

class LearningMaterialPage extends StatefulWidget {
  @override
  LearningMaterialPageState createState() => LearningMaterialPageState();
}

String trimString(String str) {
  const start = "[<'";
  const end = "'>]";
  final startIndex = str.indexOf(start);
  final endIndex = str.indexOf(end, startIndex + start.length);
  return str.substring(startIndex + start.length, endIndex);
}

class DataSearch extends SearchDelegate<String> {
  final List<String> methods = [
    trimString(methodList[0].key.toString()),
    trimString(methodList[1].key.toString()),
    trimString(methodList[2].key.toString())
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    List<Widget> resultList = buildMethod(context)
        .where((x) => trimString(x.key.toString()) == query)
        .toList();

    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (BuildContext context, int index) {
        return resultList[index];
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList =
    methods.where((x) => x.toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(
          Icons.star,
          color: Colors.pinkAccent,
        ),
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index].trim().toString();
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
