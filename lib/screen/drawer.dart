import 'package:flutter/material.dart';
import 'problem_solving/problemsolving.dart';

class DrawTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/mycard.jpg'),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Nguyễn Hoàng Dũng",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Amateur Level',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Learning Material'),
            onTap: (){
              print("TAP 1");
            }
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text('Test'),
            onTap: (){
              print("TAP 2");
            }
          ),
          ListTile(
            leading: Icon(Icons.center_focus_strong),
            title: Text('Problem Solving'),
            onTap: (){
              Navigator.push(
                context,
                  MaterialPageRoute(builder:(context) => ProblemSolvingPage())
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account Report & Analysis'),
            onTap: () {
              print("TAP 4");
            },
          ),
          ListTile(
            leading: Icon(Icons.comment),
            title: Text('Community Forum'),
            onTap: (){
              print("TAP 5");
            },
          ),
        ],
      ),
    );
  }
}
