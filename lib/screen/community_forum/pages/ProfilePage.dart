import 'package:flutter/material.dart';
import '../widgets/HeaderPage.dart';
import '../widgets/ProgressWidget.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loading = false;
  void iniState(){
    getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: "Profile"),
    );
  }

  displayPost() {
    if (loading) {
      return circularProgress();
    }
  }
  getAllPost(){
    setState(() {
      loading = true;
    });
  }
}
