import 'package:flutter/material.dart';

const backgroundMainColor = Color(0xFFF2F2F2);

class FeedbackPageState extends State<FeedbackPage>{

  TextEditingController _controller;

  void initState(){
    super.initState();
    _controller = TextEditingController(text: 'Please provide your feedback here');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Colors.white38,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/images/mycard.jpg'),
            ),
            SizedBox(height: 10.0),
            Text(
              "Nguyễn Hoàng Dũng",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            TextField(
              autofocus: true,
              maxLength: 2000,
              decoration: InputDecoration(
                hintText: 'Please type your feedback here',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackPage extends StatefulWidget{
  @override
  FeedbackPageState createState() => FeedbackPageState();
}