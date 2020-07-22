import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'solution/generalSolutionPage.dart';
import 'feedback/feedback.dart';
import 'package:flutter_tex/flutter_tex.dart';

Future getMethod(String method) async {
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

  DetailedDescriptionState(String _method) {
    method = _method;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: getMethod(method),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: "Description\n\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.black54),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: snapshot.data.data['definition'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.0,
                                        color: Colors.black54),
                                  ),
                                ]),
                          ),
                          SizedBox(height: 5.0),
                          Image.network(snapshot.data.data['image'])
                        ],
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow()],
                      ),
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Feedback',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (_) => FeedbackPage()));
                  },
                ),
                RaisedButton(
                  child: Text(
                    'General Solution',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => generalSolutionPage(
                                  method: method,
                                )));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailedDescription extends StatefulWidget {
  final String method;

  const DetailedDescription({Key key, this.method}) : super(key: key);

  @override
  DetailedDescriptionState createState() => DetailedDescriptionState(method);
}