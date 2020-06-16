import 'package:flutter/material.dart';
import 'component.dart';

class BottomBackButton extends StatelessWidget {
  const BottomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 60.0,
      child: FlatButton(
          textColor: Colors.white,
          color: Colors.green,
          child: Text("BACK", style: kBottomButtonStyle),
          onPressed: (){
            Navigator.pop(context);
          }
      ),
    );
  }
}