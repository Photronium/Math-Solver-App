import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/homepage.dart';

const backgroundMainColor = Color(0xFFF2F2F2);
const appBarColor = Color(0xFF46CB18);

void main() {
  runApp(NumberCrunching());
}

class NumberCrunching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appBarColor, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: "Algo Learning App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appBarColor,
        scaffoldBackgroundColor: backgroundMainColor,
        accentColor: Colors.green,
        fontFamily: 'Rubik',
        primaryTextTheme: Theme.of(context)
            .primaryTextTheme
            .apply(bodyColor: Colors.white, fontFamily: 'Rubik'),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            elevation: 0.0, iconTheme: IconThemeData(color: Colors.white)),
      ),
      home: HomePage(),
    );
  }
}
