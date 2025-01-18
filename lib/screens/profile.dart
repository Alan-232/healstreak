import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      body: SafeArea(child: Column(
        children: [

          Container(
            width: 400,
            height: 200,
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
                
            ),
            
            child: Text("Hellloooooo"),

            //Icon(Icons.person)
            // ,
          )
        ],
      )),
    );
  }
}
