import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'feedback/feedback.dart';


Future getMethod(String method) async{
  var db = Firestore.instance;

  QuerySnapshot qn = await db.collection("methods").getDocuments();
  DocumentSnapshot Rmethod;

  int i = 0;
  qn.documents.forEach((document) {
    if (document.data['name'] == method) Rmethod = document;
  });

  return Rmethod;
}

class DetailedDescriptionState extends State<DetailedDescription> {

  String method;

  DetailedDescriptionState(String _method){
    method = _method;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: FutureBuilder(
              future: getMethod(method),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading ..."),
                  );
                }
                else {
                  return Container(
                    child: Text(
                      snapshot.data.data['definition'],
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0, fontFamily: 'Times New Roman'),
                    ),
                    margin: EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                    ),
                  );
                }
              }
          ),
        ),
        ButtonBar(
          buttonMinWidth: 150.0,
          alignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text('General Solution'),
                color: Colors.green,
                onPressed: () {},
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text('Feedback'),
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => FeedbackPage())
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }}

class DetailedDescription extends StatefulWidget {
  final String method;
  const DetailedDescription({Key key, this.method}) : super(key: key);
  @override
  DetailedDescriptionState createState() => DetailedDescriptionState(method);
}