import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healstreak/screens/onboarding/welcome_screen.dart';
import 'package:healstreak/screens/survey/survey.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent,

      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],

      body:SafeArea(child: Center(
        child:Column( mainAxisSize: MainAxisSize.min,
          children :[

      Container(
        width: 500,
        height: 100,
        color: Colors.lightGreenAccent[100],
        child:
            Text('Heal Streak',
        textAlign: TextAlign.center,
        style:
        TextStyle(
          fontWeight:FontWeight.bold,
          fontSize: 60,
          color: Colors.black,
          fontFamily: 'Righteous',
        )
          ,),
        
      ),
          Text('Your Path To Wellness starts Here ',
              style: TextStyle(
                fontSize: 20,

              )
            ),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SurveyPage()),
            );
          }, child: Text("Get Started") )
      
        ],),


      )


      ),


    );
  }
}

