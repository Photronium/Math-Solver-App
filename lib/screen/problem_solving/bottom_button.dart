import 'package:flutter/material.dart';
import 'component.dart';
class BottomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 60.0,
      child: FlatButton(
          textColor: Colors.white,
          color: Colors.greenAccent,
          child: Text("BACK", style: kBottomButtonStyle),
          onPressed: (){
            Navigator.pop(context);
          }
      ),
    );
  }
}

class BottomNextButton extends StatelessWidget {
  BottomNextButton({this.onPressed});
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 60.0,
      child: FlatButton(
          textColor: Colors.white,
          color: Colors.greenAccent,
          child: Text("NEXT", style: kBottomButtonStyle),
          onPressed: onPressed,
      ),
    );
  }
}