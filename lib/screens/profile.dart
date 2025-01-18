import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healstreak/screens/task_screen.dart';
import 'package:healstreak/screens/survey/login.dart';
class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightGreenAccent[100],
      body: SafeArea(child: Column(
        children: [

          SizedBox(height: 50),
          Center(child: Container(
            width: 400,
            height: 200,
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text("Name : ",style:
              TextStyle(fontSize: 40),),
              Text("Age :",style: TextStyle(fontSize: 40),),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DailyTaskScreen()));
                  }, child: Text('to do list'))



            ],


            )




            //Icon(Icons.person)
            // ,
          ))

        ],
      )),
    );
  }
}
