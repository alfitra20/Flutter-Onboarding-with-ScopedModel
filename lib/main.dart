import 'package:flutter/material.dart';
import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';
import 'package:flutter_onboarding_with_scopedmodel/screens/homepage/homepage.dart';
import 'package:flutter_onboarding_with_scopedmodel/screens/login/login.dart';
import 'package:flutter_onboarding_with_scopedmodel/screens/signup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        // Default font family.
        fontFamily: 'San Francisco',

        //Default Font Style
        textTheme: TextTheme(
          display2: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold, color: Colors.black),
          button: TextStyle(fontSize: 18.0, color: Colors.white)
        ),
      ),
      home: Login(),

      routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => Login(),
      '/signup': (BuildContext context) => Signup(),
      '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}