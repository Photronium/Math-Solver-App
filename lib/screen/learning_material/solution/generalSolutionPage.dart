import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class generalSolutionPage extends StatelessWidget {
  final String method;

  generalSolutionPage({this.method});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('General Solution'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: FutureBuilder(
                  future: getMethod(method),
                  builder: (
                    _,
                    snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading ..."),
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          TeXView(
                            child: TeXViewContainer(
                              child: TeXViewDocument(
                                  snapshot.data.data['TeXSolution']
                              ),
                              style:  TeXViewStyle(
                                  fontStyle: TeXViewFontStyle(
                                    fontWeight: TeXViewFontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  contentColor: Colors.black26,

                                  margin: TeXViewMargin.all(10),
                                  padding: TeXViewPadding.all(12)
                              ),
                            ),
                            renderingEngine: TeXViewRenderingEngine.katex(),
                          ),
                          Image(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/simplex tableau.png'),
                          )
                        ],
                      );
                    }
                  }),
              margin: EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text(
                  'Example',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => generalSolutionPage(method: method,)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
