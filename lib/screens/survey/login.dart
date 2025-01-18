import 'package:flutter/material.dart';
// import 'package:healstreak/calender.dart';
import 'package:healstreak/screens/profile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  int? _age;

  void _submitSurvey() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Survey Submitted'),
          content: Text('Thank you, $_name! Age: $_age'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        title: Text('Login To HealStreak'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width:500,
                height: 250,
                decoration:
                BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child :
                    Align(
                      alignment: AlignmentDirectional(1,0),
                child:

                Text("Welcome to Heal Streak, a streak-based "
                  "app designed to support your journey to "
                  "sobriety. Track your progress, celebrate "
                  "milestones, and stay motivated every day. "
                  "To personalize your experience, simply "
                  "provide your name, age, and a few details on "
                  "the login page, and start building a healthier, "
                  "happier life today!",style:
              TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,

              ),),),),
              SizedBox(height: 50),

              TextFormField(

                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
                //name variable
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  } else if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) => _age = int.tryParse(value ?? ''),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>profile()));
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
