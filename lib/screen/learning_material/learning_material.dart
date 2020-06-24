import 'package:flutter/material.dart';
import '../drawer.dart';
import 'description_page/simplex_page.dart';
import 'description_page/cuttingPlane_page.dart';
import 'description_page/b&b_page.dart';


const PrimaryColor = const Color(0xFF3786FF);
const backgroundMainColor = Color(0xFFF2F2F2);

List<Widget> buildMethod(BuildContext context) {
  return <Widget>[
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
          title: Text('Simplex Method', style: TextStyle(fontSize: 20.0)),
          subtitle:
          Text('The most basic method to solve linear program.'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (context) => SimplexLearningPage())
            );
          },
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
          title: Text('Branch and Bound Method',
              style: TextStyle(fontSize: 20.0)),
          subtitle:
          Text(
              'The divide and conquer algorithm to solve linear integer program.'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (context) => BBLearningPage())
            );
          },
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
          title: Text(
              'Cutting Plane Method', style: TextStyle(fontSize: 20.0)),
          subtitle:
          Text(
              'Refine a feasible or objective functions by means of inequalities.'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (context) => CuttingPlaneLearningPage())
            );
          },
          trailing: Icon(Icons.navigate_next),
        ),
      ),
      key: Key('Cutting Plane Method'),
    ),
  ];
}


List<Widget> methodList = [
  Card
    (
    shape: RoundedRectangleBorder
      (
      borderRadius: BorderRadius.circular(30.0
      )
      ,
    )
    ,
    child: Container
      (
      height: 90.0
      ,
      margin: EdgeInsets.all(0.0
      )
      ,
      child: ListTile
        (
        leading: Image
          (
          image: AssetImage
            ('assets/images/iconSimplexMethod-06.png'
          )
          ,
          height: 100.0
          ,
        )
        ,
        title: Text
          ('Simplex Method'
            ,
            style: TextStyle
              (
                fontSize: 20.0
            )
        )
        ,
        subtitle: Text
          ('The most basic method to solve linear program.'
        )
        ,
        trailing: Icon
          (
            Icons.navigate_next),
      )
      ,
    )
    ,
    key: Key
      ("Simplex Method"
    )
    ,
  )
  ,

  Card
    (
    shape: RoundedRectangleBorder
      (
      borderRadius: BorderRadius.circular(30.0
      )
      ,
    )
    ,
    child: Container
      (
      height: 90.0
      ,
      margin: EdgeInsets.all(0.0
      )
      ,
      child: ListTile
        (
        leading: Image
          (
          image: AssetImage
            ('assets/images/iconBranchAndBound-06.png'
          ),
//                    height: 100.0,
        )
        ,
        title: Text
          ('Branch and Bound Method'
            ,
            style: TextStyle
              (
                fontSize: 20.0
            )
        )
        ,
        subtitle: Text
          ('The divide and conquer algorithm to solve linear integer program.'
        )
        ,
        onTap: () {},
        trailing: Icon
          (
            Icons.navigate_next),
      )
      ,
    )
    ,
    key: Key
      ('Branch and Bound Method'
    )
    ,
  )
  ,

  Card
    (
    shape: RoundedRectangleBorder
      (
      borderRadius: BorderRadius.circular(30.0
      )
      ,
    )
    ,
    child: Container
      (
      height: 90.0
      ,
      margin: EdgeInsets.all(0.0
      )
      ,
      child: ListTile
        (
        leading: Image
          (
          image: AssetImage
            ('assets/images/iconCuttingPlane-06.png'
          )
          ,
          height: 100.0
          ,
        )
        ,
        title: Text
          ('Cutting Plane Method'
            ,
            style: TextStyle
              (
                fontSize: 20.0
            )
        )
        ,
        subtitle: Text
          ('Refine a feasible or objective functions by means of inequalities.'
        )
        ,
        onTap: () {},
        trailing: Icon
          (
            Icons.navigate_next),
      )
      ,
    )
    ,
    key: Key
      ('Cutting Plane Method'
    )
    ,
  )
  ,
];


class LearningMaterialPageState extends State<LearningMaterialPage> {

  Widget _buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
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
              title: Text('Simplex Method', style: TextStyle(fontSize: 20.0)),
              subtitle:
              Text('The most basic method to solve linear program.'),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (context) => SimplexLearningPage())
                );
              },
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
              title: Text('Branch and Bound Method',
                  style: TextStyle(fontSize: 20.0)),
              subtitle:
              Text(
                  'The divide and conquer algorithm to solve linear integer program.'),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (context) => BBLearningPage())
                );
              },
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
              title: Text(
                  'Cutting Plane Method', style: TextStyle(fontSize: 20.0)),
              subtitle:
              Text(
                  'Refine a feasible or objective functions by means of inequalities.'),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (context) => CuttingPlaneLearningPage())
                );
              },
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          key: Key('Cutting Plane Method'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      appBar: AppBar(
        title: Text('Learning Material',
            style: TextStyle(fontWeight: FontWeight.w300)
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
        backgroundColor: backgroundMainColor,
      ),
      drawer: DrawTab(),
      body: _buildSuggestions(context),
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
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = '';
      },)
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
    List<Widget> resultList = buildMethod(context).where((x) =>
    trimString(x.key.toString()) == query).toList();

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
    final suggestionList = methods.where((x) =>
        x.toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) =>
          ListTile(
            leading: Icon(Icons.star, color: Colors.pinkAccent,
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
