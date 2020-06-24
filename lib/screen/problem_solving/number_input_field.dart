import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatelessWidget {
  NumberInputField({this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.numberWithOptions(signed: true),
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly,
          BlacklistingTextInputFormatter.singleLineFormatter,
        ],
        onChanged: (val) {
          if (val.length >= 5) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        controller: controller,
      ),
    );
  }
}
