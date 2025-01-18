import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healstreak/screens/onboarding/welcome_screen.dart';

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
        child:Column(children :[

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
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          }, child: Text("Go") )
      
        ],),


      )


      ),


    );
  }
}

